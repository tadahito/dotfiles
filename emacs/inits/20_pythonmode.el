(require 'python)
(defun python-shell-parse-command ()
  "Return the string used to execute the inferior Python process."
  "python3 -i")
 (add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-j" 'newline-and-indent)))

(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  (interactive)
  (let (parens-require-spaces)
        (insert-pair)))
