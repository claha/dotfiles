;; Make startup faster by reducing the frequency of garbage collection.
(setq gc-cons-threshold (* 50 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s." (emacs-init-time))))

;; Load configuration
(let* ((file (expand-file-name "conf.org" user-emacs-directory))
       (tangled-file (concat (file-name-sans-extension file) ".el")))
  ;; Tangle only if the Org file is newer than the Elisp file.
  (require 'org-macs)
  (unless (org-file-newer-than-p
	       tangled-file
	       (file-attribute-modification-time
	        (file-attributes (file-truename file))))
    (require 'ob-tangle)
    (org-babel-tangle-file file tangled-file "emacs-lisp"))
  (load-file tangled-file)
  (message "Loaded %s" tangled-file))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
