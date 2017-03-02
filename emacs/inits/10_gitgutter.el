(global-git-gutter-mode t)

(git-gutter:linum-setup)

(add-hook 'js2-mode-hook 'git-gutter-mode)
(add-hook 'ruby-mode-hook 'git-gutter-mode)
(add-hook 'python-mode-hook 'git-gutter-mode)
