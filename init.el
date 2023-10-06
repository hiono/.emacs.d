(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent
         'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;;;;;;;;;;;;;;;;;;;;;;
;; setup temporary directory
;;   emacs -q -l ~/.debug.emacs.d/init.el
(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory
            (or load-file-name byte-compile-current-file))))
    (defconst my:d:tmp
      (expand-file-name "tmp/" user-emacs-directory))))

;; use-package をインストールする
(straight-use-package 'use-package)
;; diminish をインストールする
(straight-use-package 'diminish)

;; NativeCompの設定
(with-eval-after-load 'comp
  (setq native-comp-async-jobs-number 8)
  (setq native-comp-speed 3))
(native-compile-async "~/.emacs.d/init.el")
(native-compile-async "~/.emacs.d/early-init.el")

;; オプションなしで自動的に use-package を straight.el にフォールバックする
;; 本来は (use-package hoge :straight t) のように書く必要がある
(setq straight-use-package-by-default t)

;; system command のない場合インストール試みる
(use-package use-package-ensure-system-package)

;; keep my packages updated automatically
(use-package
 auto-package-update
 :config
 (setq auto-package-update-delete-old-versions t)
 (setq auto-package-update-hide-results t)
 (auto-package-update-maybe))

;; init-loader をインストール&読み込み
(use-package init-loader)

;; ~/.emacs.d/init/ 以下のファイルを全部読み込む
(init-loader-load (expand-file-name "init/" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
