(use-package
  mmm-mode
  :init
  (use-package slim-mode)
  (use-package web-mode :config (setq web-mode-markup-indent-offset 2))
  (use-package
    js2-mode
    :hook
    (js2-mode-hook
      .
      (lambda ()
        (setq my-js-mode-indent-num 2)
        (setq js2-basic-offset my-js-mode-indent-num)
        (setq js-switch-indent-offset my-js-mode-indent-num))))
  (use-package scss-mode)
  :config
  (setq mmm-global-mode 'maybe)
  (setq mmm-submode-decoration-level 2)
  (set-face-background 'mmm-default-submode-face "gray13")
  (setq mmm-js-mode-enter-hook
    (lambda () (setq syntax-ppss-table nil)))
  (setq mmm-typescript-mode-enter-hook
    (lambda () (setq syntax-ppss-table nil)))
  (mmm-add-classes
    '((vue-embeded-slim-mode
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
