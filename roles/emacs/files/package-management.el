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

(use-package use-package-ensure
  :ensure t
  :custom
  (use-package-always-ensure t))

;; Install this first to keep it clean
(use-package no-littering
  :config
  (no-littering-theme-backups)
  (setq custom-file (make-temp-file "custom.el")))
