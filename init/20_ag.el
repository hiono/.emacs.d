;; ag
(when (executable-find "ag")
  (use-package ag
    :straight t
    :init
    (use-package wgrep
      :straight t)
    (use-package wgrep-ag
      :straight t)
    :custom
    ((ag-highlight-search t) ; 検索キーワードをハイライト
     (ag-reuse-buffers t) ; 検索用バッファを使い回す (検索ごとに新バッファを作らない)
     )
    :hook
    (ag-mode
     .
     (lambda ()
       (require 'wgrep-ag)
       (setq wgrep-auto-save-buffer t) ; 編集完了と同時に保存
       (setq wgrep-enable-key "r") ; "r" キーで編集モードに
       (wgrep-ag-setup)))
    :ensure-system-package (ag . silversearcher-ag))
  )
