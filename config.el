;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq
 projectile-project-search-path '("~/dev/nu/"))

(let ((nudev-emacs-path "~/dev/nu/nudev/ides/emacs/"))
  (when (file-directory-p nudev-emacs-path)
    (add-to-list 'load-path nudev-emacs-path)
    (require 'nu)))

(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
