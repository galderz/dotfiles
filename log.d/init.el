;; .emacs
(setq user-emacs-directory "~/.log.d/")

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; Start Galder Mods

(require 'package)
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)

(progn (cd "~/.log.d/elisp") (normal-top-level-add-subdirs-to-load-path))

(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
  (let* ((my-lisp-dir "~/.log.d/elisp/")
      (default-directory my-lisp-dir))
    (setq load-path (cons my-lisp-dir load-path))
    (normal-top-level-add-subdirs-to-load-path)))

;; if emacs 22/21, get cual.el from utils/ and put it in ~/bin/elisp
;; and add this two lines to .emacs
;; (require 'cua)
;; (CUA-mode t)
(cua-mode)

(setq x-select-enable-clipboard t)

(set-default-font "Bitstream Vera Sans Mono-12")

;; (setq prefer-window-split-horizontally nil)

;; (setq default-frame-alist (append (list
;;  '(width  . 81)  ; Width set to 81 characters
;;  '(height . 40)) ; Height set to 60 lines
;;  default-frame-alist))

(setq initial-frame-alist
      `((left . 0) (top . 0)
        (width . 237) (height . 65)))

(setq inhibit-startup-message   t)   ; Don't want any startup message
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening

(global-set-key "\C-x\C-g" 'grep)

(defun scroll-down-keep-cursor ()
   ;; Scroll the text one line down while keeping the cursor
   (interactive)
   (scroll-down 1))

(defun scroll-up-keep-cursor ()
   ;; Scroll the text one line up while keeping the cursor
   (interactive)
   (scroll-up 1)) 

(global-set-key [kp-divide] 'scroll-down-keep-cursor)
(global-set-key [kp-multiply] 'scroll-up-keep-cursor) 
;; (global-set-key (kbd "<C-right>") 'move-end-of-line)
;; (global-set-key (kbd "<C-left>") 'move-beginning-of-line)
(global-set-key (kbd "<s-right>") 'move-end-of-line)
(global-set-key (kbd "<s-left>") 'move-beginning-of-line)

;; Window splitting routines
;; (global-set-key [(f2)] 'split-window-horizontally)
;; (global-set-key [(f3)] 'split-window-vertically)
;;(setq split-window-preferred-function 'vertically)
;;(setq split-window-preferred-function (lambda (window) (split-window window nil (quote vertical))))
;;(setq prefer-window-split-horizontally nil)

(setq split-width-threshold most-positive-fixnum)

(require 'shell-command)
(shell-command-completion-mode)

(fset 'yes-or-no-p 'y-or-n-p)

(setq large-file-warning-threshold 225000000)

;; End Galder Mods

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;; Add support for ox-reveal
;;(load-library "ox-reveal")
;;(require 'ox-reveal)
(setq org-reveal-root "./")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(scroll-bar-mode (quote right))
 '(tool-bar-mode nil)
 '(transient-mark-mode t) 
 ;; '(prefer-window-split-horizontally nil)
 '(truncate-lines t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


