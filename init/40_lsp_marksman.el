(use-package markdown-mode
  :hook (markdown-mode . lsp)
  :config
  (require 'lsp-marksman)
  :ensure-system-package (marksman . "sudo snap install --edge marksman"))


(use-package markdown-preview-mode
  :after markdown-mode)


;; (use-package
;;   markdown-mode
;;   :disabled
;;   :init (use-package valign) (use-package outline-magic)
;;   :hook
;;   ((outline-mode-hook . (lambda () (require 'outline-cycle)))
;;     (outline-minor-mode-hook
;;       .
;;       (lambda ()
;;         (require 'outline-magic)
;;         (define-key outline-minor-mode-map [C-c TAB] 'outline-cycle)))
;;     (markdown-mode-hook . auto-fill-mode)
;;     (markdown-mode-hook . valign-mode))
;;   :mode (("\\.markdown$" . markdown-mode) ("\\.md$" . markdown-mode)))
