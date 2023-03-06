(use-package
 lsp-python-ms
 :ensure t
 :init
 (setq
  lsp-python-ms-auto-install-server t
  lsp-python-ms-executable (executable-find "python-language-server"))
 :hook
 (python-mode
  .
  (lambda ()
    (require 'lsp-python-ms)
    (lsp-deferred))) ; lsp or lsp-deferred
 :ensure-system-package (pylsp . "sudo snap install pylsp --edge"))
