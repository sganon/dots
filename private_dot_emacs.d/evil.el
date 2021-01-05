;; load evil
(use-package evil
  :ensure t ;; install the evil package if not installed
  :init ;; tweak evil's configuration before loading it
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  :config ;; tweak evil after loading it
  (evil-mode)

  ;; Switch panes
  (evil-define-key nil 'global (kbd "C-h") 'evil-window-left)
  (evil-define-key nil 'global (kbd "C-j") 'evil-window-down)
  (evil-define-key nil 'global (kbd "C-k") 'evil-window-up)
  (evil-define-key nil 'global (kbd "C-l") 'evil-window-right)

  ;; Move panes
  (evil-define-key nil 'global (kbd "C-S-h") 'evil-window-move-far-left)
  (evil-define-key nil 'global (kbd "C-S-j") 'evil-window-move-very-bottom)
  (evil-define-key nil 'global (kbd "C-S-k") 'evil-window-move-very-top)
  (evil-define-key nil 'global (kbd "C-S-l") 'evil-window-move-far-right)

  (evil-define-key 'normal 'global (kbd "f") 'projectile-command-map)
 )
