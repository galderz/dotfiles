;; Haskell customizations

;; Make Emacs look in Cabal directory for binaries
;;(let ((my-cabal-path (expand-file-name "~/Library/Haskell/binnnnnn")))
;;  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
;;  (add-to-list 'exec-path my-cabal-path))

;; Install sanboxed ghc-mod version that gets around ghc-mod/issues/437
(progn (cd "/opt/ghc-mod/elisp") (normal-top-level-add-subdirs-to-load-path))

(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "/opt/ghc-mod/elisp")
	   (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
          (normal-top-level-add-subdirs-to-load-path)))

;; Enable hasktags
(custom-set-variables '(haskell-tags-on-save t))

;; Choose indentation mode
;; Use haskell-mode indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; Use hi2
;;(require 'hi2)
;;(add-hook 'haskell-mode-hook 'turn-on-hi2)
;; Use structured-haskell-mode
;;(add-hook 'haskell-mode-hook 'structured-haskell-mode)

;; Add F8 key combination for going to imports block
(eval-after-load 'haskell-mode
    '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))

;; Key bindings, they slightly deviate from the ones in the haskell
;; wiki in order to avoid conflicts with 'ghc-mode' and HaRE
(custom-set-variables
 '(haskell-process-type 'cabal-repl) ;; Use Cabal's integrated REPL instead of 'ghci'
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t))
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

;; Enable compilation mode for quick compilation
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
    '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

;; GHC-MOD
;; -------

;; Initialise ghc-mod each time a file's open
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; COMPANY-GHC
;; -----------

;; Enable company-mode
(require 'company)
;; Use company in Haskell buffers
(add-hook 'haskell-mode-hook 'company-mode)
;; Use company in all buffers
;;(add-hook 'after-init-hook 'global-company-mode)

;; Get completions from ghc-mod
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

;; Rainbow Delimiters
;; ------------------

(require 'rainbow-delimiters)
(add-hook 'haskell-mode-hook #'rainbow-delimiters-mode)
