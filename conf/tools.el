;; magit
(defalias 'magit 'magit-status)
(global-set-key "\C-x\C-g" 'magit-status)
(global-set-key "\C-xg" 'magit-status)

(setenv "GIT_EDITOR" "emacsclient")
(add-hook 'shell-mode-hook 'with-editor-export-git-editor)
(setq magit-diff-options '("-w" "-b"))


