(use-package quarto-mode
  :straight
  (quarto-mode
    :type git
    :host github
    :files (:defaults "quarto-mode.el")
    :repo "quarto-dev/quarto-emacs")
  :init
  (use-package polymode
    :straight t)
  (use-package markdown-mode
    :straight t)
  (use-package poly-markdown
    :straight t)
  (use-package request
    :straight t)
  :mode ("\\.qmd$" . poly-quarto-mode))
