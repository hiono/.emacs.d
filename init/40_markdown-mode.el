(use-package markdown-mode
  :straight t
  :init
  (use-package valign
    :straight t)
  (add-hook 'markdown-mode-hook 'auto-fill-mode)
  (add-hook 'markdown-mode-hook 'valign-mode)
  :mode (("\\.markdown$" . markdown-mode) ("\\.md$" . markdown-mode)))
