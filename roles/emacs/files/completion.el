(use-package vertico
  :hook
  (after-init . vertico-mode))

(use-package prescient
  :after vertico
  :config
  (prescient-persist-mode 1))

(use-package orderless
  :init
  (setq completion-category-defaults nil)
  :custom
  (completion-styles '(orderless))
  (completion-category-overrides '((file (styles . (basic partial-completion))))))

(use-package corfu
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
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  :bind
  ("C-." . cape-dabbrev))

(use-package marginalia
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :hook
  (vertico-mode . marginalia-mode))

(use-package consult
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
  :bind
  ("C-," . embark-act)
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after (embark consult))

(use-package dabbrev
  :custom
  (dabbrev-case-replace nil)
  (dabbrev-case-distinction nil)
  (dabbrev-case-fold-search t)
  (dabbrev-upcase-means-case-search t))
