(when-system-type-match
 '(not windows-nt)
 (use-package
  ag
  :init (use-package wgrep) (use-package wgrep-ag)
  :custom
  ( ;; 検索キーワードをハイライト
   (ag-highlight-search t) ;; 検索用バッファを使い回す (検索ごとに新バッファを作らない)
   (ag-reuse-buffers t))
  :hook
  (ag-mode
   .
   (lambda ()
     (require 'wgrep-ag)
     (setq wgrep-auto-save-buffer t) ; 編集完了と同時に保存
     (setq wgrep-enable-key "r") ; "r" キーで編集モードに
     (wgrep-ag-setup)))
  :ensure-system-package (ag . silversearcher-ag)))
