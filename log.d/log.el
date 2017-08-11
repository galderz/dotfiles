;; log.el --- Using Emacs as log viewer configuration
;;
;;; Commentary:
;; Special Emacs configuration for using it to check logs

;;; Code:


;; Set a specific directory for it
(setq user-emacs-directory "~/.log.d/")


;; Set command as meta
(setq mac-command-modifier 'meta)


;; Simpler y/n answers
(fset 'yes-or-no-p 'y-or-n-p)


;; Preferred theme
(add-to-list 'load-path "~/.log.d/themes")
(require 'color-theme-tomorrow)
(color-theme-tomorrow--define-theme day)


;; Favourite font for reading logs
(set-frame-font "Bitstream Vera Sans Mono-12")


;; Start with maximized windows
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; Force grep window to be split up/down
(setq split-width-threshold most-positive-fixnum)


;; Files are big, avoid unnecessary warnings
(setq large-file-warning-threshold 225000000)


;; Shortcut for grep command
(global-set-key "\C-x\C-g" 'grep)


;; Remove tool bar
(tool-bar-mode -1)


;; Don't want any startup message
(setq inhibit-startup-message t)


;; Don't want any backup files
(setq make-backup-files nil)


;; Don't want any .saves files
(setq auto-save-list-file-name nil)


;; Don't want any auto saving
(setq auto-save-default nil)


;; Turn off wrapping of lines
(set-default 'truncate-lines t)


;;; log.el ends here
