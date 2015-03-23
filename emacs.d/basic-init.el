;; git-init.el - init file for git commit emacs sessions

;; Enable numbered columns by default
(setq column-number-mode t)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Load 'wombat' theme only in terminal mode
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (load-theme 'wombat)))
(add-hook 'window-setup-hook 'on-after-init)
