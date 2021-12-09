(use-package text-adjust
  :straight (:host github :repo "uwabami/text-adjust.el")
  :config
  (defun text-adjust-space-before-save-if-needed ()
    (when (memq major-mode '(org-mode text-mode wl-draft-mode))
      (text-adjust-space-buffer)))
  (defalias 'spacer 'text-adjust-space-buffer)
  :hook (before-save-hook . text-adjust-space-before-save-if-needed)
  :custom
  (setq
    adaptive-fill-regexp
    "[ \t]*"
    adaptive-fill-mode t
    text-adjust-rule-kutouten text-adjust-rule-kutouten-zkuten))
