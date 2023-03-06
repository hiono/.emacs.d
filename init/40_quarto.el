(use-package
 quarto-mode
 :straight
 (quarto-mode
  :type git
  :host github
  :files (:defaults "quarto-mode.el")
  :repo "quarto-dev/quarto-emacs")
 :init
 (use-package polymode)
 (use-package markdown-mode)
 (use-package poly-markdown)
 (use-package request)
 :mode ("\\.qmd$" . poly-quarto-mode))
