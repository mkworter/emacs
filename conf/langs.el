;; Ruby
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(defadvice enh-ruby-mode-set-encoding (around stop-enh-ruby-mode-set-encoding)
  "If ruby-not-insert-magic-comment is true, stops enh-ruby-mode-set-encoding."
  (if (and (boundp 'ruby-not-insert-magic-comment)
           (not ruby-not-insert-magic-comment))
      ad-do-it))
(ad-activate 'enh-ruby-mode-set-encoding)
(setq-default ruby-not-insert-magic-comment t)

(require 'ruby-end)

(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)


(defun make-ruby-scratch-buffer ()
  (with-current-buffer (get-buffer-create "*ruby scratch*")
    (enh-ruby-mode)
    (current-buffer)))

(defun ruby-scratch ()
  (interactive)                         ;
  (pop-to-buffer (make-ruby-scratch-buffer)))

(require 'rubocop)
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)
(add-hook 'enh-ruby-mode-hook
          '(lambda ()
             (setq tab-width 2)
             )
          )

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'ac-robe-setup "ac-robe" "auto-complete robe" nil nil)
(add-hook 'robe-mode-hook 'ac-robe-setup)

; Yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(define-key yaml-mode-map "\C-m" 'newline-and-indent)

;; Python
(add-hook 'python-mode-hook (lambda () (auto-complete-mode -1)))
;elpy
(elpy-enable)
(setq elpy-rpc-virtualenv-path 'current)

;Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
