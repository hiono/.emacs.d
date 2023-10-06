;; auto-format different source code files extremely intelligently
;; https://github.com/radian-software/apheleia
(use-package apheleia
  :ensure t
  :diminish 'apheleia-mode
  :config
  (apheleia-global-mode +1))
;; (setf (alist-get 'black apheleia-formatters) '("black" "--option" "..." "-"))

(use-package
  elisp-autofmt
  :hook (emacs-lisp-mode . elisp-autofmt-mode))
