;; window
(if window-system (progn
  ;; (setq initial-frame-alist '((width . 175) (height . 60) (top . 10) (left . 0)))
  (setq initial-frame-alist '((width . 175) (height . 60)))
;  (set-background-color "White")
;  (set-foreground-color "Black")
  (set-frame-parameter nil 'alpha 100)
;; hide scroll bar
  (set-scroll-bar-mode 'nil)
))
(setq split-width-threshold nil) ; 縦2分割

;; Dired
(require 'dired-x)
(setq dired-dwim-target t)

;; Wdired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; monokai
(load-theme 'monokai t)

(package-install 'highlight-symbol)
(require 'highlight-symbol)
(setq highlight-symbol-idle-delay 0.5) ;; highlight after 0.5s idle
(add-hook 'prog-mode-hook 'highlight-symbol-mode) ;; turn on when programming lang file is open
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode) ;; M-p/M-n でシンボル間の移動


(setq ring-bell-function 'ignore)

;; Command-Key and Option-Key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; FullScreen
(setq ns-use-native-fullscreen nil)
(define-key global-map (kbd "M-RET") 'toggle-frame-fullscreen)

;; hide menu, tool bar
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Cursor
(set-default 'cursor-type 'bar)
(if (eq window-system 'x)
    (mouse-avoidance-mode 'animate))

;; Scroll
(setq scroll-step 1)

;; Indent uses space
(setq-default indent-tabs-mode nil)

;; high light
(global-hl-line-mode t)

;; save cursor posision
(save-place-mode 1)

;; character set utf-8 LF
(set-default-coding-systems 'utf-8-unix)

;; auto indent
(setq indent-line-function 'indent-relative-maybe)
(global-set-key "\C-m" 'newline-and-indent);

;; Script files appended exec permission by saved.
(defun make-file-executable ()
  "Make the file of this buffer executable, when it is a script source."
  (save-restriction
    (widen)
    (if (string= "#!" (buffer-substring-no-properties 1 (min 3 (point-max))))
        (let ((name (buffer-file-name)))
          (or (equal ?. (string-to-char (file-name-nondirectory name)))
              (let ((mode (file-modes name)))
                (set-file-modes name (logior mode (logand (/ mode 4) 73)))
                (message (concat "Wrote " name " (+x)"))))))))
(add-hook 'after-save-hook 'make-file-executable)

;; language
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)

;; title bar
(setq frame-title-format (format "%%b"))

;; auto fill mode off
(setq text-mode-hook 'turn-off-auto-fill)


;; exit
(defadvice save-buffers-kill-emacs
  (before safe-save-buffers-kill-emacs activate)
  "safe-save-buffers-kill-emacs"
  (unless (y-or-n-p "Exit Emacs Really?")
    (keyboard-quit)
))

;; disable auto save
(setq make-backup-files nil)
(setq auto-save-default nil)


;; Emacs Load Path
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elpa")
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/usr/local/bin"
              "~/.rbenv/shims"
              "~/.nodebrew/current/bin"
              "~/.bin"
              )
             ))
;; PATH と exec-path に同じ物を追加
(exec-path-from-shell-initialize)
;; Font
(cond
 ((string-match "apple-darwin" system-configuration)
  (let* ((size 15)
         (asciifont "Ricty") ; ASCII fonts
         (jpfont "Ricty") ; Japanese fonts
         (h (* size 10))
         (fontspec (font-spec :family asciifont))
         (jp-fontspec (font-spec :family jpfont)))
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
    (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
    (set-fontset-font nil '(#x0080 . #x024F) fontspec)
    (set-fontset-font nil '(#x0370 . #x03FF) fontspec))
 )
((string-match "linux" system-configuration)
(if window-system (progn
 (let* ((size 12)
        (asciifont "Myrica M") ; ASCII fonts
        (jpfont "Ricty") ; Japanese fonts
        (h (* size 10))
        (fontspec (font-spec :family asciifont))
        (jp-fontspec (font-spec :family jpfont)))
   (set-face-attribute 'default nil :family asciifont :height h)
   (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
   (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
   (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
   (set-fontset-font nil '(#x0080 . #x024F) fontspec)
   (set-fontset-font nil '(#x0370 . #x03FF) fontspec))
 ))
  )
)

;; hilight () pair
(setq-default transient-mark-mode t)
(show-paren-mode)

;; startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Yes No -> y n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Control H
(define-key global-map "\C-h" 'delete-backward-char)

;; goto-line
(global-set-key "\C-c\C-j" 'goto-line)
(global-set-key "\C-cj" 'goto-line)

;; git-gutter
(global-git-gutter-mode +1)

;; delete region
(delete-selection-mode t)

;; Tab width
(setq default-tab-width 2)

;; current directory open
(defun open-finder()
  (interactive)
  (shell-command "open ."))

;; directory open
(defun finder-open(dirname)
  (interactive "DirectoryName:")
  (shell-command (concat "open " dirname)))

;; Launch iterm.app with Current directry
(defun iterm ()
  "Open iterm.app with current dir."
  (interactive)
  (let ((dir default-directory))
    (shell-command (concat "open -a iterm.app " dir))))

