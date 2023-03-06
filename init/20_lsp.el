(use-package
  lsp-mode
  :custom
  ((lsp-inhibit-message t)
    (lsp-message-project-root-warning t)
    (create-lockfiles nil)
    (lsp-enable-indentation nil))
  :hook (prog-major-mode . lsp-prog-major-mode-enable))

(use-package
  lsp-ui
  :after lsp-mode
  :custom (scroll-margin 0)
  :hook (lsp-mode . lsp-ui-mode))

(use-package
  company-lsp
  :after (lsp-mode company yasnippet)
  :defines company-backends
  :functions company-backend-with-yas
  :init
  (cl-pushnew (company-backend-with-yas 'company-lsp)
    company-backends))
