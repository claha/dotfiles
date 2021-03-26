;; Initialise installed packages.
(setq package-enable-at-startup t)

;; Allow loading from the package cache.
(setq package-quickstart t)

;; Do not resize the frame at this early stage.
(setq frame-inhibit-implied-resize t)

;; Hide GUI elements early.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(setq inhibit-startup-screen t)
(setq use-file-dialog nil)
