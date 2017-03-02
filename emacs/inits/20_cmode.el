;; C/C++設定---------------------------------------------->
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)
;; C++
(defun add-c++-mode-conf ()
  (c-set-style "stroustrup")
  (show-paren-mode t))
(add-hook 'c++-mode-hook 'add-c++-mode-conf)

;; C
(defun add-c-mode-common-conf ()
  (c-set-style "stroustrup")
  (show-paren-mode t))
(add-hook 'c-mode-common-hook 'add-c-mode-common-conf)

;; 括弧の自動挿入
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))
(defun c-mode-hook--electric-pair ()
  (dolist (k '("\"" "\'" "(" "[" "{"))
    (define-key c-mode-map k 'electric-pair)))
(add-hook 'c-mode-hook 'c-mode-hook--electric-pair)

;;; fly-check
(add-hook 'c-mode-hook 'flycheck-mode)
