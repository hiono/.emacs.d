(use-package mmm-mode
  :straight t
  :init
  (use-package slim-mode
    :straight t)
  (use-package web-mode
    :straight t
    :config (setq web-mode-markup-indent-offset 2))
  (use-package js-mode
    :straight t
    :hook
    (js-mode-hook .
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
  (use-package scss-mode
    :straight t)
  :config
  (setq mmm-global-mode 'maybe)
  (setq mmm-submode-decoration-level 2)
  (set-face-background 'mmm-default-submode-face "gray13")
  (setq mmm-js-mode-enter-hook
    (lambda () (setq syntax-ppss-table nil)))
  (setq mmm-typescript-mode-enter-hook
    (lambda () (setq syntax-ppss-table nil)))
  (mmm-add-classes
    '
    (
      (vue-embeded-slim-mode
        :submode slim-mode
        :front "^<template.*lang=\"pug\">\n"
        :back "^</template>")
      (vue-embeded-web-mode
        :submode web-mode
        :front "^<template>\n"
        :back "^</template>\n")
      (vue-embeded-js-mode
        :submode js-mode
        :front "^<script>\n"
        :back "^</script>")
      (vue-embeded-scss-mode
        :submode scss-mode
        :front "^<style.*lang=\"scss\">\n"
        :back "^</style>")))

  (mmm-add-mode-ext-class nil "\\.vue\\'" 'vue-embeded-slim-mode)
  (mmm-add-mode-ext-class nil "\\.vue\\'" 'vue-embeded-web-mode)
  (mmm-add-mode-ext-class nil "\\.vue\\'" 'vue-embeded-js-mode)
  (mmm-add-mode-ext-class nil "\\.vue\\'" 'vue-embeded-scss-mode))
