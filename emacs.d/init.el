;; init.el

;; Avoid extra TAB indents when pasting or auto-generating code
(electric-indent-mode 0)

;; Enable copying from Emacs to OSX
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))
  
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
  
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; Enable numbered columns by default
(setq column-number-mode t)

;; save/restore opened files and windows config
(desktop-save-mode 1) ; 0 for off

;; Prevent the creation of backup and autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Prevent creation of unwanted buffers
(load "~/.emacs.d/unwanted-buffers")

;; Add repositories
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Load 'wombat' theme only in terminal mode
;; (defun on-after-init ()
;;  (unless (display-graphic-p (selected-frame))
;;        (load-theme 'wombat)))
;;        (load-theme 'zenburn)
;;(add-hook 'window-setup-hook 'on-after-init)

;; Better than the standard bindings `C-x <right>' and `C-x <right>',
;; because you can hold these down to repeat: cycle through buffers.
(when (fboundp 'next-buffer)            ; Emacs 21+.
     (global-set-key [left] 'previous-buffer) ; `left'
     (global-set-key [right] 'next-buffer))   ; `right'

;; Shift + up/down/left/right for moving between windows
(when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))

;; Make windmove work in org-mode:
;; http://orgmode.org/manual/Conflicts.html
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; Windmove in use, avoid conflict with orgmode
;; This MUST be defined before org mode itself!
;; (setq org-replace-disputed-keys t)

;; Org mode customizations
(require 'org)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Make sure $PATH is same as command line one
;;(exec-path-from-shell-initialize)) 

;; Magit customizations
(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

;; Haskell customizations
(load "~/.emacs.d/haskell")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn t)
