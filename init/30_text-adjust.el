(use-package text-adjust
  :straight (:host github :repo "uwabami/text-adjust.el")
  :config
  (defun text-adjust-space-before-save-if-needed ()
    (when (memq major-mode '(org-mode text-mode wl-draft-mode))
      (text-adjust-space-buffer)))
  (defalias 'spacer 'text-adjust-space-buffer)
  (setq adaptive-fill-regexp "[ \t]*")
  (setq adaptive-fill-mode t)
  (setq text-adjust-rule-kutouten text-adjust-rule-kutouten-zkuten)
  (setq text-adjust-rule-space
    '
    ((("[「」、。［］｛｝（）『』]" "" "\\ca") "")
      (("\\ca" "" "[「」『』、。［］｛｝（）]") "")
      (("\\cj\\|)" "" "[[(0-9a-zA-Z+]") " ")
      (("[])/!?0-9a-zA-Z+]" "" "(\\|\\cj") " ")
      (("]" " " "(") "")))
  :hook (before-save-hook . text-adjust-space-before-save-if-needed))
