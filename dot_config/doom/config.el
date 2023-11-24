;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Simon Ganon"
      user-mail-address "simon@y2m.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 12))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-ephemeral)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! obsidian
  (obsidian-specify-path "~/Documents/Vaults")
  (setq obsidian-inbox-directory "Inbox")
  (global-obsidian-mode t))

(map! :g :mode global-obsidian-mode "C-c C-o" #'obsidian-follow-link-at-point)
(map! :g :mode global-obsidian-mode "C-c C-l" #'obsidian-insert-wikilink)
(map! :g :mode global-obsidian-mode "C-c C-b" #'obsidian-backlink-jump)

(map! :g :desc "Go to right window" "C-l" #'evil-window-right)
(map! :g :desc "Go to left window" "C-h" #'evil-window-left)
(map! :g :desc "Go to top window" "C-k" #'evil-window-top)
(map! :g :desc "Go to bottom window" "C-j" #'evil-window-bottom)


(after! company
  (setq company-idle-delay 0)
  (setq company-show-quick-access t)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-idle-delay 1)
  (setq company-async-timeout 5)
  (setq company-minimum-prefix-length 1)
  (setq company-abort-on-unique-match t)
  (setq-local company-backends '(company-lsp)
              company-dabbrev nil
              company-dabbrev-other-buffers nil
              company-dabbrev-ignore-case nil
              company-dabbrev-downcase nil))

(after! neotree
  (setq doom-themes-neotree-file-icons 't))

(after! go-mode
  (setq gofmt-command "goimports")
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'after-save-hook 'gofmt nil 'make-it-local))))

(after! doom-dashboard
  (setq doom-dashboard-week-agenda t))

(after! mu4e
  (setq mu4e-mu-binary "/Users/sganon/homebrew/bin/mu")
  (setq send-mail-function 'smtpmail-send-it)
  (setq smtpmail-default-smtp-server "smtp.gmail.com")
  (setq auth-sources '( "~/.authinfo" ))
  (setq smtpmail-smtp-user "simon@y2m.io")
  (setq smtpmail-smtp-server "smtp.gmail.com")
  (setq smtpmail-stream-type 'starttls)
  (setq smtpmail-smtp-service 587)
  (setq +mu4e-gmail-accounts '(("simon@y2m.io" . "/work")))
  (setq mu4e-get-mail-command "/usr/local/bin/mbsync -a"
	message-sendmail-f-is-evil t
        sendmail-program "/Users/sganon/homebrew/bin/msmtp"
        message-send-mail-function #'message-send-mail-with-sendmail
	message-sendmail-extra-arguments '("--read-envelope-from")))
