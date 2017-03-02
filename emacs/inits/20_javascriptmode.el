;; javascript設定---------------------------------------->
;;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\.js$" . js2-mode))
(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js2-basic-offset 4)))

;;; fly-check
(add-hook 'javascript-mode-fook 'flycheck-mode) ; => (flycheck-mode)

;;; flymake-jshintの設定
;;; Path環境依存(各種LinuxOS,MacOSに合わせる)
(add-hook 'js2-mode-hook '(lambda ()
                            (require 'flymake-jshint)
                            (flymake-jshint-load)))
(setq exec-path (append exec-path '("/usr/local/bin")))
(custom-set-variables
 '(help-at-pt-timer-delay 0.9)
 '(help-at-pt-display-when-idle '(flymake-overlay)))

;; 括弧の自動挿入
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))
(defun js2-mode-hook--electric-pair ()
  (dolist (k '("\"" "\'" "(" "[" "{"))
    (define-key js2-mode-map k 'electric-pair)))
(add-hook 'js2-mode-hook 'js2-mode-hook--electric-pair)

(require 'flymake-eslint)
(add-hook 'js-mode-hook 'flymake-eslint-load)
