;; Package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; No scrollbar, flash parens, no tool bar or tooltips
(scroll-bar-mode 0)
(show-paren-mode t)
(tool-bar-mode 0)
(tooltip-mode 0)
(blink-cursor-mode 0)

;;Disabling spash and welcome screens
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;;Changing the backup dir
(setq backup-directory-alist `(("." . "~/.saves")))

;;Syntax Highlighting
(global-font-lock-mode t)

;;Enabling Evil
;(add-to-list 'load-path "~/.emacs.d/evil")
;(require 'evil)
;(evil-mode 1)
;(setq evil-default-cursor t)

;;Enable Ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;Org Mode
;(require 'org)
;(setq org-startup-indented t)
;(setq org-log-done 'time)
;(setq org-default-notes-file "~/org/Project.org")
;(setq org-hide-leading-stars t)
;(setq org-enforce-todo-dependencies)
;(global-set-key "\C-ca" 'org-agenda)
;(define-key global-map "\C-cc" 'org-capture)

;;Trim whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;Some ergonomic translates
;Bracket swap
(keyboard-translate ?\( ?\[)
(keyboard-translate ?\[ ?\()
(keyboard-translate ?\) ?\])
(keyboard-translate ?\] ?\))
