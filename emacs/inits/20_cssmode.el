;;  CSS設定---------------------------------------------->
;;; css-mode
(defun css-mode-hooks ()
  "css-mode hooks"
  (setq cssm-indent-function #'cssm-style-indenter)
  (setq cssm-indent-level 2)
  (setq cssm-indent-tabs-mode nil)
  (setq cssm-newline-before-closing-bracket t))
(add-hook 'css-mode-hook 'css-mode-hooks)
(add-to-list 'auto-mode-alist '("\\.css\\'"    . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'"    . css-mode))
