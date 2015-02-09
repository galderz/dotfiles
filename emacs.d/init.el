;;; init.el

;; Prevent the creation of backup and autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Load 'wombat' theme only in terminal mode
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (load-theme 'wombat)))

(add-hook 'window-setup-hook 'on-after-init)

;; Org mode customizations
(require 'org)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
