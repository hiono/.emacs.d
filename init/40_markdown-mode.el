(use-package markdown-mode
  :straight t
  :init
  (use-package valign
    :straight t)
  (use-package outline-magic
    :straight t)
  :hook
  ((outline-mode-hook . (lambda () (require 'outline-cycle)))
    (outline-minor-mode-hook
      .
      (lambda ()
        (require 'outline-magic)
        (define-key outline-minor-mode-map [C-c TAB] 'outline-cycle)))
    (markdown-mode-hook . auto-fill-mode)
    (markdown-mode-hook . valign-mode))
  :mode
  (("\\.markdown$" . markdown-mode)
    ("\\.md$" . markdown-mode)))
