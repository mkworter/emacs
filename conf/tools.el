;; magit
(defalias 'magit 'magit-status)
(global-set-key "\C-x\C-g" 'magit-status)
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

