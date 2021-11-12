;; elpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)

(package-initialize)

(unless (package-installed-p 'monokai-theme)
  (package-refresh-contents)
  (package-install 'monokai-theme))

(unless (package-installed-p 'exec-path-from-shell)
  (package-refresh-contents)
  (package-install 'exec-path-from-shell))

(unless (package-installed-p 'auto-complete)
  (package-refresh-contents)
  (package-install 'auto-complete))

(unless (package-installed-p 'git-gutter)
  (package-refresh-contents)
  (package-install 'git-gutter))

(unless (package-installed-p 'elscreen)
  (package-refresh-contents)
  (package-install 'elscreen))

(unless (package-installed-p 'magit)
  (package-refresh-contents)
  (package-install 'magit))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'helm)
  (package-refresh-contents)
  (package-install 'helm))

(unless (package-installed-p 'helm-ag)
  (package-refresh-contents)
  (package-install 'helm-ag))

(unless (package-installed-p 'helm-ls-git)
  (package-refresh-contents)
  (package-install 'helm-ls-git))

(unless (package-installed-p 'helm-ghq)
  (package-refresh-contents)
  (package-install 'helm-ghq))

;; ruby
(unless (package-installed-p 'enh-ruby-mode)
  (package-refresh-contents) (package-install 'enh-ruby-mode))

(unless (package-installed-p 'ruby-end)
  (package-refresh-contents) (package-install 'ruby-end))

(unless (package-installed-p 'inf-ruby)
  (package-refresh-contents) (package-install 'inf-ruby))

(unless (package-installed-p 'rubocop)
  (package-refresh-contents) (package-install 'rubocop))

(unless (package-installed-p 'rspec-mode)
  (package-refresh-contents) (package-install 'rspec-mode))

(unless (package-installed-p 'robe)
  (package-refresh-contents) (package-install 'robe))

(unless (package-installed-p 'migemo)
  (package-refresh-contents) (package-install 'migemo))

(unless (package-installed-p 'undo-tree)
  (package-refresh-contents) (package-install 'undo-tree))

(unless (package-installed-p 'tss)
  (package-refresh-contents) (package-install 'tss))

(unless (package-installed-p 'js2-mode)
  (package-refresh-contents) (package-install 'js2-mode))

(unless (package-installed-p 'tern)
  (package-refresh-contents) (package-install 'tern))

(unless (package-installed-p 'json-mode)
  (package-refresh-contents) (package-install 'json-mode))

(unless (package-installed-p 'terraform-mode)
  (package-refresh-contents) (package-install 'terraform-mode))

(unless (package-installed-p 'yaml-mode)
  (package-refresh-contents) (package-install 'yaml-mode))

(unless (package-installed-p 'better-defaults)
 (package-refresh-contents) (package-install 'better-defaults))

(unless (package-installed-p 'elpy)
 (package-refresh-contents) (package-install 'elpy))

(unless (package-installed-p 'py-autopep8)
 (package-refresh-contents) (package-install 'py-autopep8))

(unless (package-installed-p 'migemo)
 (package-refresh-contents) (package-install 'migemo))
