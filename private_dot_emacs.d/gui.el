(if (eq system-type 'gnu/linux)
  (menu-bar-mode -1)
  )
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(global-linum-mode t) ;; Line number
(setq linum-format "%4d")
(setq-default tab-width 4)

;(use-package base16-theme
;  :ensure t
;  :config
; (load-theme 'base16-atelier-heath t))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))
