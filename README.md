# Nire Dotfiles

1. Install command line tools
```bash
xcode-select --install
```

2. Kick off install
```bash
curl -o- https://raw.githubusercontent.com/galderz/dotfiles/master/install.sh | bash
```

3. Restart machine

4. Run updates

5. `Preferences` > `Security & Privacy` > `Full Disk Access` to `Terminal` and `iTerm`

6. Restore initial files and folders
```bash
cd ~/.dotfiles
make restore-from-time-machine
```

7. Install fonts
```bash
cd ~/.dotfiles
make fonts
```

8. Add SSH keys
```bash
cd ~/.dotfiles
make ssh
```

9. Load iTerm2 preferences from `~/.dotfiles/iterm2`

10. `Preferences` > `Dock` > `Left`

10. Start Emacs daemon

11. Complete other steps
