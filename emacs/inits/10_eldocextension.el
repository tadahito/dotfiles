;; eldoc-extension の設定
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (require 'eldoc-extension)
             (eldoc-mode t)))
