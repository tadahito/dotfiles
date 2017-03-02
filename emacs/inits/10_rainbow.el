;; rainbow-delimiter-mode の設定
(defun my-rainbow-delimiters-mode-turn-on ()
  (rainbow-delimiters-mode t))
(add-hook 'emacs-lisp-mode-hook 'my-rainbow-delimiters-mode-turn-on)

;; rainbow-mode の設定
(defun my-rainbow-mode-turn-on ()
  (rainbow-mode t))
(add-hook 'css-mode-hook 'my-rainbow-mode-turn-on)
(add-hook 'html-mode-hook 'my-rainbow-mode-turn-on)
