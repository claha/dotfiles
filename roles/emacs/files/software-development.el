(customize-set-variable 'indent-tabs-mode nil)
(customize-set-variable 'tab-width 4)

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

(use-package docker
  :commands docker)

(use-package dockerfile-mode)

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
