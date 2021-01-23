(use-package dashboard
  :ensure t)

(use-package all-the-icons
  :ensure t)

(use-package dashboard
  :ensure t
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-center-content t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-show-shortcuts nil)
  (dashboard-modify-heading-icons '((recents . "file-text")
									(bookmarks . "book")))
  (setq dashboard-items '((projects . 5)
						  (recents  . 5)))
  (add-to-list 'dashboard-items '(agenda) t)
  (setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)
  (setq dashboard-week-agenda t))
