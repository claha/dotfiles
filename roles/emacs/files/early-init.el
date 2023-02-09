;; Do not make installed packages available at startup.
(setq package-enable-at-startup nil)

;; Hide/Skip GUI stuff early.
(setq frame-inhibit-implied-resize t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(setq inhibit-startup-screen t)
(setq use-file-dialog nil)
