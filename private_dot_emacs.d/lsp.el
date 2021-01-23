(use-package lsp-mode
  :ensure t
  :after lsp-python-ms
  :hook (
	 (go-mode . lsp)
	 (python-mode . lsp)
	 (typescript-mode . lsp)
	 (rust-mode . lsp)
	 )
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-clients-typescript-log-verbosity "debug"
	lsp-clients-typescript-plugins 
	(vector
	 (list :name "@Microsoft/typescript-tslint-plugin")))
  )

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook (
	 (lsp-mode . lsp-ui-mode)
	 )
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-delay 3)
  )

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
