(customize-set-variable 'indent-tabs-mode nil)
(customize-set-variable 'tab-width 4)

(add-to-list 'auto-mode-alist '("\\CMakeLists.txt\\'" . cmake-ts-mode))
(add-to-list 'auto-mode-alist '("\\Dockerfile\\'" . dockerfile-ts-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
(add-to-list 'major-mode-remap-alist '(sh-mode . bash-ts-mode))

(use-package yaml-mode
  :defer t)

(use-package jinja2-mode
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

(use-package docker
  :commands docker)

(use-package envrc
  :init (envrc-global-mode))

(use-package cc-mode
  :defer t
  :custom
  (c-default-style "linux")
  (c-basic-offset 2)
  :config
  (c-set-offset 'case-label '+))

(use-package restclient
  :commands restclient-mode)
