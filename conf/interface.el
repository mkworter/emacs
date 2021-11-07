;; helm
(require 'helm-config)
(require 'helm-ls-git)
(require 'helm-ag)
(helm-mode 1)

(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-create-directory . nil))
(add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-do-copy . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-do-rename . nil))

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

(defvar helm-source-emacs-commands
  (helm-build-sync-source "Emacs commands"
    :candidates (lambda ()
                  (let ((cmds))
                    (mapatoms
                     (lambda (elt) (when (commandp elt) (push elt cmds))))
                    cmds))
    :coerce #'intern-soft
    :action #'command-execute)
  "A simple helm source for Emacs commands.")

(defvar helm-source-emacs-commands-history
  (helm-build-sync-source "Emacs commands history"
    :candidates (lambda ()
                  (let ((cmds))
                    (dolist (elem extended-command-history)
                      (push (intern elem) cmds))
                    cmds))
    :coerce #'intern-soft
    :action #'command-execute)
  "Emacs commands history")

(custom-set-variables
 '(helm-mini-default-sources '(helm-source-emacs-commands-history
                               helm-source-emacs-commands
                               helm-source-buffers-list
                               helm-source-recentf
                               helm-source-files-in-current-dir
                               helm-source-ls-git
                               )))

(setq helm-ag-base-command "ag --nocolor --nogroup")

(define-key global-map (kbd "C-;") 'helm-mini)
(global-set-key "\C-x;" 'helm-mini)
(global-set-key "\C-c;" 'helm-mini)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c C-s") 'helm-do-ag-this-file)
(global-set-key (kbd "C-c s") 'helm-do-ag)

;; helm-ghq
(require 'helm-for-files)
(require 'helm-ghq)

;; ;; 重くなるのでhelm-for-filesだけハイライトを無効化する
(defadvice helm-for-files
  (around helm-for-files-no-highlight activate)
  "No highlight when using helm-for-files."
  (let ((helm-mp-highlight-delay nil))
    ad-do-it))

;; ;; helm-for-filesのソースにhelm-ghqのソースを追加
(add-to-list 'helm-for-files-preferred-list 'helm-source-ghq)
(define-key global-map (kbd "C-]") 'helm-ghq)
