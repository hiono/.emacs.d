(use-package elisp-autofmt
  :commands (elisp-autofmt-save-hook-for-this-buffer)
  :hook (emacs-lisp-mode . elisp-autofmt-save-hook-for-this-buffer)
  :straight
  (elisp-autofmt
    :type git
    :host gitlab
    :files (:defaults "elisp-autofmt")
    :repo "ideasman42/emacs-elisp-autofmt"))
