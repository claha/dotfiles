;; Make startup faster by reducing the frequency of garbage collection.
(defvar default-gc-cons-threshold gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s." (emacs-init-time))
            (setq gc-cons-threshold default-gc-cons-threshold)))

;; Configure package management
(require 'package)

(setq package-install-upgrade-built-in t
      package-archives
      '(("gnu-elpa" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("gnu-elpa" . 3)
        ("melpa" . 2)
        ("nongnu" . 1)))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents t))

;; Install and configure packages
(use-package no-littering
  :ensure t
  :config
  (no-littering-theme-backups)
  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))
  (when (file-exists-p custom-file)
    (load-file custom-file)))

(use-package emacs
  :init
  (global-hl-line-mode 1)
  (global-display-line-numbers-mode t)
  :custom
  (initial-scratch-message nil)
  (column-number-mode t)
  (visible-bell t)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt))
  :config
  (set-window-scroll-bars (minibuffer-window) nil nil)
  (add-to-list 'default-frame-alist '(alpha-background . 90))
  (put 'downcase-region 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'narrow-to-region 'disabled nil)
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq browse-url-browser-function
        '(("." . browse-url-generic)))
  (setq browse-url-generic-program "qutebrowser")
  (setq use-short-answers t)
  (setq large-file-warning-threshold nil)
  (setq vc-follow-symlinks t)
  (global-unset-key (kbd "<C-down-mouse-1>"))
  (global-unset-key (kbd "<C-down-mouse-2>"))
  (global-unset-key (kbd "<C-down-mouse-3>"))
  (global-unset-key (kbd "<S-down-mouse-1>"))
  (global-unset-key (kbd "<S-down-mouse-2>"))
  (global-unset-key (kbd "<S-down-mouse-3>")))

(use-package visual-fill-column
  :ensure t
  :custom
  (visual-fill-column-width 50)
  (visual-fill-column-center-text t))

(use-package doom-themes
  :ensure t
  :init
  (load-theme 'doom-material t))

(use-package doom-modeline
  :ensure t
  :hook
  (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-minor-modes t)
  (doom-modeline-buffer-file-name-style 'truncate-except-project)
  :config
  (setq doom-modeline-icon t))

(use-package minions
  :ensure t
  :hook
  (doom-modeline-mode . minions-mode))

(use-package all-the-icons
  :ensure t)

(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono"))

(use-package vertico
  :ensure t
  :hook
  (after-init . vertico-mode))

(use-package prescient
  :ensure t
  :after vertico
  :config
  (prescient-persist-mode 1))

(use-package orderless
  :ensure t
  :init
  (setq completion-category-defaults nil)
  :custom
  (completion-styles '(orderless))
  (completion-category-overrides '((file (styles . (basic partial-completion))))))

(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  :bind
  (:map corfu-map
        ("<escape>" . corfu-quit)
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous))
  :init
  (global-corfu-mode))

(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  :bind
  ("C-." . cape-dabbrev))

(use-package marginalia
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :hook
  (vertico-mode . marginalia-mode))

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("M-y" . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g o" . consult-outline)
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ("M-s f" . consult-find)
         ("M-s F" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ("M-s e" . consult-isearch-history))
  :init
  (setq register-preview-delay 0)
  (setq register-preview-function #'consult-register-format)
  (advice-add #'completing-read-multiple
              :override #'consult-completing-read-multiple)
  (setq xref-show-xrefs-function #'consult-xref)
  (setq xref-show-definitions-function #'consult-xref)
  (setq completion-in-region-function #'consult-completion-in-region)
  :config
  (recentf-mode 1)
  (setq consult-narrow-key "<")
  (setq consult-project-root-function
        (lambda ()
          (when-let (project (project-current))
            (car (project-roots project))))))

(use-package embark
  :ensure t
  :bind
  ("C-," . embark-act)
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :ensure t
  :after (embark consult))

(use-package dabbrev
  :custom
  (dabbrev-case-replace nil)
  (dabbrev-case-distinction nil)
  (dabbrev-case-fold-search t)
  (dabbrev-upcase-means-case-search t))

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

(use-package magit
  :ensure t
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function
   #'magit-display-buffer-fullframe-status-v1))

(use-package git-commit
  :ensure t
  :after magit
  :config
  (setq git-commit-summary-max-length 50)
  (add-hook 'git-commit-mode-hook
            #'(lambda ()
                (setq fill-column 72)
                (setq-local comment-auto-fill-only-comments nil))))

(use-package forge
  :ensure t
  :after magit)

(use-package pinentry
  :ensure t
  :custom
  (epg-pinentry-mode 'loopback)
  :init
  (setenv "INSIDE_EMACS" (format "%s,comint" emacs-version))
  (pinentry-start))

(use-package diff-hl
  :ensure t
  :hook ((prog-mode . diff-hl-mode)
         (org-mode . diff-hl-mode)
         (text-mode . diff-hl-mode)
         (dired-mode . diff-hl-dired-mode))
  :custom
  (diff-hl-side 'right))

(use-package hungry-delete
  :ensure t
  :custom
  (hungry-delete-join-reluctantly t)
  :hook
  (after-init . global-hungry-delete-mode))

(use-package wgrep
    :ensure t)

(use-package yaml-mode
  :defer t)

(use-package jinja2-mode
  :defer t)

(use-package cmake-mode
  :defer t)

(use-package rust-mode
  :defer t)

(use-package go-mode
  :defer t)

(use-package flycheck
  :defer t)

(use-package compile
  :custom
  (compilation-ask-about-save nil)
  (compilation-always-kill t)
  (compilation-scroll-output 'first-error))

(use-package ansi-color
  :hook
  (compilation-filter . colorize-compilation-buffer)
  :config
  (defun colorize-compilation-buffer ()
    (ansi-color-apply-on-region compilation-filter-start (point))))

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

(use-package docker
  :ensure t
  :commands docker)

(use-package dockerfile-mode
    :ensure t)

(use-package envrc
  :ensure t
  :init (envrc-global-mode))

(use-package pyvenv
  :ensure t
  :hook (python-mode . pyvenv-mode)
  :bind
  (:map python-mode-map
        ("C-c C-a" . pyvenv-activate)))

(use-package blacken
  :ensure t
  :after python
  :bind
  (:map python-mode-map
        ("C-c C-b" . blacken-buffer)))

(use-package cc-mode
  :defer t
  :custom
  (c-default-style "linux")
  (c-basic-offset 2)
  :config
  (c-set-offset 'case-label '+))

(use-package shell
  :commands shell
  :config
  (add-hook 'shell-mode-hook (lambda () (display-line-numbers-mode 0))))

(use-package term
  :commands term
  :config
  (add-hook 'term-mode-hook (lambda () (display-line-numbers-mode 0))))

(use-package org
  :config
  (defun org-mode-setup ()
    (display-line-numbers-mode 0)
    (visual-line-mode 1)
    (org-indent-mode))
  (setq org-ellipsis " ▾")
  (setq org-hide-emphasis-markers t)
  :hook (org-mode . org-mode-setup))

(use-package org-bullets
  :ensure t
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package org-src
  :after org
  :config
  (setq org-src-window-setup 'current-window)
  (setq org-src-fontify-natively t)
  (setq org-src-preserve-indentation t)
  (setq org-src-tab-acts-natively t))

(use-package org-present
  :ensure t
  :after org
  :config
  (defun org-present-hook ()
    (setq-local face-remapping-alist '((default (:height 1.5) variable-pitch)
                                       (header-line (:height 4.5) variable-pitch)
                                       (org-document-title (:height 1.75) org-document-title)
                                       (org-code (:height 1.55) org-code)
                                       (org-verbatim (:height 1.55) org-verbatim)
                                       (org-block (:height 1.25) org-block)
                                       (org-block-begin-line (:height 0.7) org-block)))
    (setq header-line-format " ")
    (org-present-big)
    (org-present-read-only)
    (org-present-beginning)
    (visual-fill-column-mode +1)
    (global-hl-line-mode -1))
  (defun org-present-quit-hook ()
    (setq-local face-remapping-alist nil)
    (setq header-line-format nil)
    (org-present-small)
    (org-present-read-write)
    (org-present-show-cursor)
    (visual-fill-column-mode -1)
    (global-hl-line-mode +1))
  (defun org-present-prepare (buffer-name heading)
    (org-overview)
    (org-show-entry)
    (org-show-children))
  (setq org-present-after-navigate-functions 'org-present-prepare)
  :hook
  ((org-present-mode . org-present-hook)
   (org-present-mode-quit . org-present-quit-hook)))

(use-package helpful
  :ensure t
  :bind
  ([remap describe-command] . helpful-command)
  ([remap describe-function] . helpful-callable)
  ([remap describe-key] . helpful-key)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable))

(use-package tldr
  :ensure t
  :commands tldr)

(use-package restclient
  :ensure t
  :commands restclient-mode)

(let ((local-file (expand-file-name "local.el" user-emacs-directory)))
  (if (file-readable-p local-file)
      (load-file local-file)))
