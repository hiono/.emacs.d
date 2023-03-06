(use-package
  whiqxotespace
  :diminish global-whitespace-mode
  :init
  :custom
  ((whitespace-style
     '(face ; faceで可視化
        trailing ; 行末
        tabs ; タブ
        spaces ; スペース
        empty ; 先頭/末尾の空行
        space-mark ; 表示のマッピング
        tab-mark))
    (whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
         ;; WARNING: the mapping below has a problem.
         ;; When a TAB occupies exactly one column, it will display the
         ;; character ?\xBB at that column followed by a TAB which goes to
         ;; the next TAB column.
         ;; If this is a problem for you, please, comment the line below.
         (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
    ;; スペースは全角のみを可視化
    (whitespace-space-regexp "\\(\u3000+\\)")
    ;; 保存前に自動でクリーンアップ
    (whitespace-action '(auto-cleanup)) (global-whitespace-mode 1))
  :custom-face
  (whitespace-trailing
    ((nil (:background "#232323" :foreground "DeepPink" :underline t))))
  (whitespace-tab
    ((nil
       (:background "#232323" :foreground "LightSkyBlue" :underline t))))
  (whitespace-space
    ((nil
       (:background "#232323" :foreground "GreenYellow" :weight bold))))
  (whitespace-empty ((nil :background "#232323"))))
