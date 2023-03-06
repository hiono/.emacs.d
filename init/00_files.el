(use-package
 files
 :straight nil
 :bind (("C-x C-r" . revert-buffer-no-confirm))
 :config
 (defun revert-buffer-no-confirm (&optional force-reverting)
   (interactive "P")
   (message "force-reverting value is %s" force-reverting)
   (if (or force-reverting (not (buffer-modified-p)))
       (revert-buffer :ignore-auto :noconfirm)
     (error "The buffer has been modified"))))
