;; elpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)

(package-initialize)

(unless (package-installed-p 'exec-path-from-shell)
  (package-refresh-contents)
  (package-install 'exec-path-from-shell))

;; (unless (package-installed-p 'monokai-theme)
;;   (package-refresh-contents)
;;   (package-install 'monokai-theme))

(unless (package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company))

(unless (package-installed-p 'git-gutter)
  (package-refresh-contents)
  (package-install 'git-gutter))

(unless (package-installed-p 'elscreen)
  (package-refresh-contents)
  (package-install 'elscreen))

(unless (package-installed-p 'magit)
  (package-refresh-contents)
  (package-install 'magit))
