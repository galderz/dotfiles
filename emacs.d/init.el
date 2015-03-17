;; init.el

;; Prevent the creation of backup and autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Prevent creation of unwanted buffers
(load "~/.emacs.d/unwanted-buffers")

;; Load 'wombat' theme only in terminal mode
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (load-theme 'wombat)))
(add-hook 'window-setup-hook 'on-after-init)

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

