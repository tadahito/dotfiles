;;;式の評価結果を注釈するための設定
(when (require 'lispxmp nil t)
  ;; emacs-lisp-modeでC-c C-dを押すと注釈される
  (define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp))
