(add-to-list 'exec-path "/home/sganon/go/bin")
(setenv "GOPRIVATE" "git.blueboard.io/*")
(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))
