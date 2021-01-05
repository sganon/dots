(defconst user-init-dir
          (cond ((boundp 'user-emacs-directory)
                 user-emacs-directory)
                ((boundp 'user-init-directory)
                 user-init-directory)
                (t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "melpa.el")
(load-user-file "ivy.el")
(load-user-file "gui.el")
(load-user-file "evil.el")
(load-user-file "projectile.el")
(load-user-file "go.el")
(load-user-file "typescript.el")
(load-user-file "lsp.el")
(load-user-file "magit.el")
(load-user-file "dashboard.el")
(load-user-file "line.el")
(load-user-file "vterm.el")
(load-user-file "dap.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-python-ms base16-theme dap-mode vterm plan9-theme ivy typescript-mode doom-themes doom-modeline magit flycheck evil-collection helm-projectile projectile lsp-ui company-lsp lsp-mode go-mode use-package evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
