(use-package dap-mode
  :ensure t
  :config
  (add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))
  (require 'dap-go)
  )
