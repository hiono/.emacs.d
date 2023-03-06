(use-package
 text-adjust
 :straight (:host github :repo "uwabami/text-adjust.el")
 :config
 (defun text-adjust-space-before-save-if-needed ()
   (when (memq major-mode '(org-mode text-mode wl-draft-mode))
     (text-adjust-space-buffer)))
 (defalias 'spacer 'text-adjust-space-buffer)
 (setq adaptive-fill-regexp "[ \t]*")
 (setq adaptive-fill-mode t)
 (setq text-adjust-rule-kutouten text-adjust-rule-kutouten-zkuten)
 (setq text-adjust-rule-space
       '((("\\cj\\|)" "" "[[(0-9a-zA-Z+]") " ")
         (("[])/!?0-9a-zA-Z+]" "" "\\cj") " ")))
 ;; (setq text-adjust-rule-space
 ;;   '
 ;;   ((("[「」、。［］｛｝（）『』]" "" "\\ca") "")
 ;;     (("\\ca" "" "[「」『』、。［］｛｝（）]") "")
 ;;     (("\\cj\\|)" "" "[[(0-9a-zA-Z+]") " ")
 ;;     (("[])/!?0-9a-zA-Z+]" "" "(\\|\\cj") " ")
 ;;     (("\\[\\ca\\]" " " "(\\ca)") "")))
 :hook (before-save-hook . text-adjust-space-before-save-if-needed))

;; text-adjust-rule のフォーマットは
;; (("左端文字列" "対象文字列" "右端文字列") "変換文字列") という構成の
;; リストです. "左端文字列", "対象文字列", "右端文字列" は正規表現で
;; 記述可能でこの 3 つ を連結した文字列にマッチした個所を変換対象とし,
;; "対象文字列" を "変換文字列" へ変換します.
;;
;; ■例1
;; (("男湯" " " "女湯")   "|壁|")
;; 変換前 = "男湯 女湯",  変換後 = "男湯|壁|女湯"
;;
;; ■例2
;; ((("\\cj"        "" "[0-9a-zA-Z]")   " ")
;;  (("[0-9a-zA-Z]" "" "\\cj")          " "))
;; 変換前 = "YouはShoooock!",  変換後 = "You は Shoooock!"
;;
;; "変換文字列" では "{", "}" を用いた独自記法によって対象文字列を
;; 参照することが可能です. "{1}", "{2}", "{3}" はそれぞれ順に "左端文字列",
;; "対象文字列", "右端文字列" の全体を表わし, "{2-3}" は "対象文字列" の
;; 3 番目の正規表現の括弧に対応します. また, "{1}" と "{1-0}" は同値です.
;;
;; ■例3
;; (("月" "火水木" "金") "{1}{2}{3}")
;; 変換前 = "月火水木金", 変換後 = "月月火水木金金"
;;
;; ■例4
;; (("" "\\(.ン\\)\\(.ン\\)" "") "{2-2}{2-1}")
;; 変換前 = "夜明けのガンマン", 変換後 = "夜明けのマンガン"
;;
;; text-adjust-mode-skip-rule は各モードに特化した特殊変換ルールで,
;; 主に変換をさせたくない個所をスキップする目的で用意されています.
;; text-adjust-rule-space, text-adjust-rule-kutouten,
;; text-adjust-rule-codecheck のそれぞれの先頭に追加されたのち, 実行されます.


;; 日本語用正規表現 (M-x describe-category を参照)
;\\cK カタカナ
;\\cC 漢字
;\\cH ひらがな
;\\cS 全角記号
;\\cj 日本語 (上記全部)
;\\ck 半角カナ


;; (defvar text-adjust-mode-skip-rule
;;   '((sgml-mode . ((("<" "[^>]*" ">") "{2}")))))
;; ;(defvar text-adjust-fill-regexp ", \\|\\. \\|! \\|\\? \\|を\\| ")
;; ;(defvar text-adjust-fill-regexp "[,.!?] \\|[を ]"
;; (defvar text-adjust-fill-regexp "[,!] \\|[を ]" "この正規表現の次で優先して改行する.")
;; (defvar text-adjust-fill-start 60
;;   "各行とも, この値から fill-column までの値までが\
;;  text-adjust-fill の有効範囲.")
