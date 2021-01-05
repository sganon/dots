(use-package dashboard
  :ensure t)

(use-package all-the-icons
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                        (projects . 5)
                        (agenda . 5))))
