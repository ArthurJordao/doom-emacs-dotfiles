;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq
 projectile-project-search-path '("~/dev/nu/")
 doom-font (font-spec :family "Fira Code" :size 16)
 avy-all-windows 't)

(let ((nudev-emacs-path "~/dev/nu/nudev/ides/emacs/"))
  (when (file-directory-p nudev-emacs-path)
    (add-to-list 'load-path nudev-emacs-path)
    (require 'nu)))

(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

(defun conditionally-enable-lispy ()
  (when (eq this-command 'eval-expression)
    (lispy-mode 1)))
(add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)

(add-to-list 'default-frame-alist '(height . 48))

(add-to-list 'default-frame-alist '(width . 160))

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metaup
        :n "M-k" #'org-metadown)
  (setq! org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
         org-log-done 'time
         org-todo-keyword-faces
         '(("TODO" :foreground "#7c7c75" :weigh normal :underline t)
           ("WAITING" :foreground "#9f7efe" :weigh normal :underline t)
           ("INPROGRESS" :foreground "#0098dd" :weigh normal :underline t)
           ("DONE" :foreground "#50a14f" :weigh normal :underline t)
           ("CANCELLED" :foreground "#ff6480" :weigh normal :underline t))))
