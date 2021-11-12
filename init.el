
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq load-path
      (append '(
                "~/.emacs.d/conf"
                ) load-path))

(load "packages.el")
(load "settings.el")
(load "tools.el")
(load "langs.el")
(load "interface.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-mini-default-sources
   '(helm-source-emacs-commands-history helm-source-emacs-commands helm-source-buffers-list helm-source-recentf helm-source-files-in-current-dir helm-source-ls-git))
 '(package-selected-packages
   '(highlight-symbol molokai-theme monokai-theme exec-path-from-shell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
