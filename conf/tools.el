;; magit
(defalias 'magit 'magit-status)
(global-set-key "\C-xg" 'magit-status)

(setenv "GIT_EDITOR" "emacsclient")
(add-hook 'shell-mode-hook 'with-editor-export-git-editor)
(setq magit-diff-options '("-w" "-b"))

;; AutoComplete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode 1)
(ac-config-default)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)


;; Elscreen
(setq elscreen-prefix-key (kbd "C-z"))
(elscreen-start)
(setq elscreen-tab-display-kill-screen nil)
(setq elscreen-tab-display-control nil)
(setq elscreen-display-tab nil)

;; Migemo
(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))

;; Set your installed path
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(migemo-init)
