(customize-set-variable 'vc-follow-symlinks t)

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
