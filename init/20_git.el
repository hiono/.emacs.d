;; git
(use-package magit
  :straight t
  :bind (("C-x m" . magit-status))
  :custom
  (magit-refs-show-commit-count 'all)
  (magit-log-buffer-file-locked t)
  (magit-revision-show-gravatars nil)
  :custom-face
  (magit-diff-added
    ((t (:extend t :background "gray20" :foreground "green"))))
  (magit-diff-added-highlight
    (
      (t
        (:extend
          t
          :background "gray20"
          :foreground "green"
          :weight bold))))
  (magit-diff-context ((t (:extend t :foreground "blue"))))
  (magit-diff-context-highlight
    ((t (:extend t :background "grey20" :foreground "grey70"))))
  (magit-diff-removed
    ((t (:extend t :background "gray20" :foreground "red"))))
  (magit-diff-removed-highlight
    (
      (t
        (:extend
          t
          :background "gray20"
          :foreground "red"
          :weight bold))))
  (magit-section-highlight ((t (:background "gray20")))))

(use-package magit-gitflow
  :straight t
  :after magit
  :hook (magit-mode . turn-on-magit-gitflow)
  :if (eq system-type 'gnu/linux)
  :ensure-system-package ("/usr/lib/git-core/git-flow" . git-flow))

(use-package magit-lfs
  :straight t
  :ensure-system-package (git-lfs . git-lfs)
  :after magit)

(use-package gitconfig-mode
  :straight
  (:host github :repo "magit/git-modes" :files ("gitconfig-mode.el"))
  :mode ("/\\.?git/?config$" "/\\.gitmodules$")
  :hook (gitconfig-mode . flyspell-mode))

(use-package gitignore-mode
  :straight
  (:host github :repo "magit/git-modes" :files ("gitignore-mode.el"))
  :mode ("/\\.gitignore$" "/\\.git/info/exclude$" "/git/ignore$"))

(use-package gitattributes-mode
  :straight
  (:host
    github
    :repo "magit/git-modes"
    :files ("gitattributes-mode.el"))
  :mode ("/\\.gitattributes$"))
