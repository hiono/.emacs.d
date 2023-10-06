;; (use-package eglot)
;; (add-to-list 'eglot-server-programs '(python-mode "pylsp"))

;; (use-package
;;  python-mode
;;  :ensure nil
;;  :hook (python-mode . eglot-ensure))

;; (with-eval-after-load 'eglot
;;   (add-to-list
;;    'eglot-server-programs `(markdown-mode . ("efm-langserver"))))


;; ;; お好みでどうぞ
;; (define-key global-map [(super d)] 'smart-jump-go)

;; (with-eval-after-load "lsp-bash"
;;   (lsp-register-client
;;    (make-lsp-client
;;     :new-connection (lsp-tramp-connection '("bash" "stdio"))
;;     :major-modes '(shell-script-mode)
;;     :priority 1
;;     :remote? t
;;     :multi-root t
;;     :server-id 'bash-ls-remote
;;     :initialized-fn
;;     (lambda (workspace)
;;       (with-lsp-workspace
;;        workspace
;;        (lsp--set-configuration (lsp-configuration-section "bash"))))))
;;   (lsp-register-client
;;    (make-lsp-client
;;     :new-connection (lsp-tramp-connection "<binary name (e.g. pyls, rls)>")
;;     :major-modes '(python-mode)
;;     :remote? t
;;     :server-id 'pyls-remote))
;;   (lsp-register-client
;;    (make-lsp-client
;;     :new-connection (lsp-tramp-connection "<binary name (e.g. pyls, rls)>")
;;     :major-modes '(sh-mode)
;;     :remote? t
;;     :server-id 'bash-ls)))

(use-package
 lsp-mode
 :init
 ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
 (setq lsp-keymap-prefix "C-c l") (setq gc-cons-threshold 100000000)
 (setq read-process-output-max (* 1024 1024)) ;; 1mb
 (setq lsp-idle-delay 0.500)
 (setq lsp-log-io nil) ; if set to true can cause a performance hit
 :hook
 ( ;; replace XXX-mode with concrete major-mode(e. g. python-mode)
  (prog-mode-hook . lsp-deferred)
  ;; if you want which-key integration
  (lsp-mode . lsp-enable-which-key-integration))
 :commands lsp)

;; optionally
(use-package
 lsp-ui
 :after lsp
 :commands lsp-ui-mode
 :custom (scroll-margin 0)
 :hook (lsp-mode . lsp-ui-mode))

;; ;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; ;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; if you are campany user
(use-package
 company-lsp
 :after (lsp-mode company yasnippet)
 :defines company-backends
 :functions company-backend-with-yas
 :init
 (cl-pushnew (company-backend-with-yas 'company-lsp)
             company-backends))
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode :after lsp)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package
 which-key
 :diminish 'which-key-mode
 :config (which-key-mode))

(use-package smart-jump
  :commands smart-jump-setup-default-registers)
