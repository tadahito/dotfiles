;; redo+.el設定
(when (require 'redo+ nil t)
  (setq undo-no-redo t)
  (define-key global-map (kbd "M-/") 'redo))
