;; Hide/Skip GUI stuff early.
(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize t
      use-dialog-box nil
      use-file-dialog nil
      inhibit-splash-screen t
      inhibit-startup-screen t
      inhibit-x-resources t
      inhibit-startup-buffer-menu t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

;; Initialize installed packages.
(setq package-enable-at-startup t)
