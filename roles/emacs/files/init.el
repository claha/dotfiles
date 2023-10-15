;; Make startup faster by reducing the frequency of garbage collection.
(defvar default-gc-cons-threshold gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s." (emacs-init-time))
            (setq gc-cons-threshold default-gc-cons-threshold)))

;; Load config files
(dolist (file '("package-management.el"  ;; Important that this is first!
                "user-interface.el"
                "completion.el"
                "version-control.el"
                "software-development.el"
                "org.el"
                "misc.el"))
        (load-file (expand-file-name file user-emacs-directory)))

(use-package emacs
  :custom
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt))
  :config
  (put 'downcase-region 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'narrow-to-region 'disabled nil)
  (setq browse-url-browser-function
        '(("." . browse-url-generic)))
  (setq browse-url-generic-program "qutebrowser")
  (setq use-short-answers t)
  (setq large-file-warning-threshold nil))

(use-package visual-fill-column
  :ensure t
  :custom
  (visual-fill-column-width 50)
  (visual-fill-column-center-text t))

(use-package savehist
  :init
  (savehist-mode))

(use-package project)

(use-package dired
  :commands (dired dired-jump)
  :bind
  ("C-x C-j" . dired-jump)
  :custom
  (dired-listing-switches "-aghov --group-directories-first"))

(use-package dired-single
  :ensure t
  :after dired
  :bind
  (:map dired-mode-map
        ([remap dired-find-file] . dired-single-buffer)
        ([remap dired-up-directory] . dired-single-up-directory)))

(use-package ibuffer
  :bind
  (("C-x C-b" . ibuffer)
   ("C-x k" . kill-this-buffer)))

(use-package ace-window
  :ensure t
  :bind
  ("C-x o" . ace-window)
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package ag
  :ensure t
  :commands ag)

(use-package dumb-jump
  :ensure t
  :config
  (setq dumb-jump-force-searcher 'ag)
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package hungry-delete
  :ensure t
  :custom
  (hungry-delete-join-reluctantly t)
  :hook
  (after-init . global-hungry-delete-mode))

(use-package wgrep
  :ensure t)

(use-package paren
  :init
  (show-paren-mode 1)
  :custom
  (show-paren-delay 0.0))

(use-package electric-pair
  :hook
  (prog-mode . electric-pair-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(let ((local-file (expand-file-name "local.el" user-emacs-directory)))
  (if (file-readable-p local-file)
      (load-file local-file)))
