(use-package org
  :config
  (defun org-mode-setup ()
    (display-line-numbers-mode 0)
    (visual-line-mode 1)
    (org-indent-mode))
  (setq org-ellipsis " ▾")
  (setq org-hide-emphasis-markers t)
  (setq org-src-window-setup 'current-window)
  (setq org-src-fontify-natively t)
  (setq org-src-preserve-indentation t)
  (setq org-src-tab-acts-natively t)
  :hook (org-mode . org-mode-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package org-present
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
