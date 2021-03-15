//usr/bin/env jbang "$0" "$@" ; exit $?
//DEPS info.picocli:picocli:4.2.0
//DEPS org.eclipse.jgit:org.eclipse.jgit:5.8.1.202007141445-r


import org.eclipse.jgit.api.ListBranchCommand;
import org.eclipse.jgit.api.errors.GitAPIException;
import org.eclipse.jgit.lib.Ref;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.revwalk.RevCommit;
import org.eclipse.jgit.revwalk.RevWalk;
import org.eclipse.jgit.storage.file.FileRepositoryBuilder;
import org.eclipse.jgit.transport.RefSpec;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;

import org.eclipse.jgit.api.Git;

@Command(name = "git-cleanup", mixinStandardHelpOptions = true, version = "git-cleanup 0.1",
        description = "git-cleanup made with jbang")
class gitCleanup implements Callable<Integer> {

    public static final String MASTER = "main";
    public static final String REMOTE_MASTER = "refs/remotes/upstream/main";
    @Parameters(index = "0", description = "Set the project directory (default is the current directory)", defaultValue = "")
    private File directory;

    @CommandLine.Option(names = "--mine", description = "Set the remote name associated with your fork", defaultValue = "origin")
    private String mine;

    @CommandLine.Option(names = "--dry-run", description = "Enable / Disable Dry Run", defaultValue = "true")
    private boolean dryRun;

    public static void main(String... args) {
        int exitCode = new CommandLine(new gitCleanup()).execute(args);
        System.exit(exitCode);
    }

    @Override
    public Integer call() throws Exception {
        Repository repository = getGitRepository(directory);
        Git git = new Git(repository);

        // master check
        if (! repository.getBranch().equalsIgnoreCase(MASTER)) {
            if (git.status().call().isClean()) {
                System.out.println("\uD83D\uDECE️  Switching to the `master` branch");
                git.checkout().setName(MASTER).call();
            } else {
                System.out.println("☠️ The repository should be on the `master` branch - cannot switch to `master`, there are pending changes");
                return -1;
            }
        }

        // Update
        System.out.println("\uD83D\uDECE️  Fetching origin...");
        git.fetch().setRemote("origin");
        System.out.println("\uD83D\uDECE️  Fetching " + mine +"...");
        git.fetch().setRemote(mine);

        // Retrieve the remote and local branches
        List<Ref> remotes = git.branchList().setListMode(ListBranchCommand.ListMode.REMOTE).call();
        List<Ref> locals = git.branchList().call();

        // For each local branch, check if there is a remote branch with a matching name either in `origin` or in `mine`
        // Exclude master of course.
        Map<String, Ref> localToRemote = new LinkedHashMap<>();
        for (Ref local : locals) {
            String name = getBranchName(local);
            if (name.equalsIgnoreCase(MASTER)) {
                continue;
            }
            List<Ref> matchingRemoteBranches  = remotes.stream()
                    .filter(branch -> getBranchName(branch).equalsIgnoreCase(name))
                    .collect(Collectors.toList());

            for (Ref matching : matchingRemoteBranches) {
                String remote = getRemote(matching);
                if (remote.equalsIgnoreCase(mine)  || remote.equalsIgnoreCase("origin")) {
                    localToRemote.put(name, matching);
                }
            }
        }

        System.out.println("\uD83D\uDD75️  Found " + localToRemote.size() + " branches with matching remote branches");
        localToRemote.forEach((name, ref) -> System.out.println("\t " + name + " --> " + getRemote(ref)));

        System.out.println("\uD83D\uDD75️  Verifying is local branches have been merged in origin/master");
        List<Ref> canBeDeleted = new ArrayList<>();
        for (Ref local : locals) {
            if (getBranchName(local).equalsIgnoreCase(MASTER)) {
                continue;
            }
            // Check if local branches have been merged in origin/master
            try (RevWalk revWalk = new RevWalk(repository)) {
                RevCommit masterHead = revWalk.parseCommit(repository.resolve(REMOTE_MASTER));
                RevCommit branchHead = revWalk.parseCommit( repository.resolve(local.getName()));
                if (revWalk.isMergedInto(branchHead, masterHead)) {
                    System.out.println("\t ➡️  " + getBranchName(local) + " has been merged in origin/master");
                    canBeDeleted.add(local);
                }
            }
        }

        if (canBeDeleted.isEmpty()) {
            System.out.println("\uD83C\uDF7A No local branches have been merged in origin/master");
            return 0;
        }

        if (dryRun) {
            System.out.println("ℹ️  Dry run - skip branch deletion, pass --dry-run=false to enable deletion");
            return 0;
        }

        canBeDeleted.forEach(ref -> {
            String name = getBranchName(ref);
            System.out.println("⚡ Deleting " + name);
            try {
                System.out.println("\t Deleting " + name + " locally");
                git.branchDelete().setBranchNames(ref.getName()).call();
            } catch (GitAPIException e) {
                System.out.println("☠️ Unable to delete local branch " + e.getMessage());
                System.out.println("ℹ️ Try executing `git branch -d " + name + "`");
            }

            Ref remote  = localToRemote.get(name);
            if (remote != null) {
                System.out.println("\t Deleting " + name + " remotely");
                String rem  = getRemote(remote);
                RefSpec refSpec = new RefSpec()
                        .setSource(null)
                        .setDestination(ref.getName());
                try {
                    git.push().setRefSpecs(refSpec).setRemote(rem).call();
                } catch (GitAPIException e) {
                    System.out.println("☠️ Unable to delete remote branch " + e.getMessage());
                    System.out.println("ℹ️ Try executing `git push origin --delete " + name + "`");
                }
            }
        });

        System.out.println("\uD83C\uDF7A All done!");

        return 0;
    }

    private String getBranchName(Ref ref) {
        if (ref.getName().startsWith("refs/heads/")) {
            return ref.getName().substring("refs/heads/".length());
        }
        if (ref.getName().startsWith("refs/remotes/")) {
            String stripped = ref.getName().substring("refs/remotes/".length());
            // Remove remote name
            return stripped.substring(stripped.indexOf("/") + 1);
        }
        return ref.getName();
    }

    private String getRemote(Ref ref) {
        if (ref.getName().startsWith("refs/remotes/")) {
            String stripped = ref.getName().substring("refs/remotes/".length());
            return stripped.substring(0, stripped.indexOf("/") + 1);
        }
        throw new IllegalArgumentException(ref.getName() + " is not a remote branch");
    }

    private Repository getGitRepository(File root) throws IOException {
        FileRepositoryBuilder builder = new FileRepositoryBuilder();
        Repository repository = builder.setGitDir(new File(root.getAbsoluteFile(), ".git"))
                .setMustExist(true)
                .build();
        if (! repository.getObjectDatabase().exists()) {
            throw new IllegalArgumentException(root.getAbsolutePath() + " is not a git repository");
        }
        System.out.println("ℹ️  Git repository: " + repository.getDirectory() + " - current branch: " + repository.getBranch());
        return repository;
    }
}
