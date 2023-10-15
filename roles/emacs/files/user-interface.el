(global-hl-line-mode 1)
(global-display-line-numbers-mode t)
(column-number-mode t)
(customize-set-variable 'visible-bell t)
(set-window-scroll-bars (minibuffer-window) nil nil)
(add-to-list 'default-frame-alist '(alpha-background . 90))
(global-unset-key (kbd "<C-down-mouse-1>"))
(global-unset-key (kbd "<C-down-mouse-2>"))
(global-unset-key (kbd "<C-down-mouse-3>"))
(global-unset-key (kbd "<S-down-mouse-1>"))
(global-unset-key (kbd "<S-down-mouse-2>"))
(global-unset-key (kbd "<S-down-mouse-3>"))

(use-package ef-themes
  :ensure t
  :init
  (load-theme 'ef-maris-dark t))

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
