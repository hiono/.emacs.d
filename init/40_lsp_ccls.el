(use-package
  ccls
  :init (setq ccls-sem-highlight-method 'font-lock)
  :hook
  ((c-mode c++-mode objc-mode cuda-mode)
    .
    (lambda ()
      (require 'ccls)
      (lsp)))
  :ensure-system-package (ccls . "sudo snap install ccls --classic")
  :config
  (setq ccls-executable "/snap/bin/ccls")
  (setq ccls-initialization-options '(:index (:comments 2))))
