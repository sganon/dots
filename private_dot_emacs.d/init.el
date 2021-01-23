(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
		 user-emacs-directory)
		((boundp 'user-init-directory)
		 user-init-directory)
		(t "~/.emacs.d/")))

(add-to-list 'exec-path "/home/sganon/.cargo/bin")


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

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/agendas/gmailpersonal.org" "~/org/tasks.org" "~/org/standups.org"))
(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  )

(use-package restclient
  :ensure t)

(use-package rust-mode
  :ensure t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(zweilight-theme yaml-mode evil-org lsp-python-ms base16-theme dap-mode vterm plan9-theme ivy typescript-mode doom-themes doom-modeline magit flycheck evil-collection helm-projectile projectile lsp-ui company-lsp lsp-mode go-mode use-package evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
