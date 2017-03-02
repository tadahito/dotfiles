;; perl設定---------------------------------------------->
;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist
      (append '(("\\.\\([pP][Llm]\\|al\\)$" . cperl-mode)) auto-mode-alist))
(add-hook 'cperl-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq cperl-indent-level 4)
             (setq cperl-indent-parens-as-block t)
             (setq cperl-close-paren-offset -2)))
(setq cperl-indent-level 4                   ; インデント幅を4にする
      cperl-continued-statement-offset 4 ; 継続する文のオフセット※
      cperl-brace-offset -4            ; ブレースのオフセット
      cperl-label-offset -4          ; labelのオフセット
      cperl-indent-parens-as-block t ; 括弧もブロックとしてインデント
      cperl-close-paren-offset -4  ; 閉じ括弧のオフセット
      cperl-tab-always-indent t  ; TABをインデントにする
      cperl-highlight-variables-indiscriminately t) ; スカラを常にハイライトする
(add-hook 'cperl-mode-hook
          '(lambda ()
             (flymake-mode t)))

;; perl-completion設定
(require 'perl-completion)
(add-hook 'cperl-mode-hook
          (lambda ()
            (auto-complete-mode t)
            (add-to-list 'ac-sources 'ac-source-perl-completion)))
(add-hook 'cperl-mode-hook (lambda ()
                             (setq plcmp-use-keymap nil)
                             (require 'perl-completion)
                             (add-to-list 'ac-sources 'ac-source-perl-completion)
                             (perl-completion-mode t)
                             (define-key plcmp-mode-map (kbd "C-c m") 'plcmp-cmd-menu)
                             (define-key plcmp-mode-map (kbd "C-c s") 'plcmp-cmd-smart-complete)
                             (define-key plcmp-mode-map (kbd "C-c d") 'plcmp-cmd-show-doc)
                             (define-key plcmp-mode-map (kbd "C-c p") 'plcmp-cmd-show-doc-at-point)
                             (define-key plcmp-mode-map (kbd "C-c y") 'plcmp-cmd-clear-all-cashes)))

;; perltidy設定
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region)))

;; perldoc -mの結果にsource上からjump
(put 'perl-module-thing 'end-op
     (lambda ()
       (re-search-forward "\\=[a-zA-Z][a-zA-Z0-9_:]*" nil t)))
(put 'perl-module-thing 'beginning-op
     (lambda ()
       (if (re-search-backward "[^a-zA-Z0-9_:]" nil t)
           (forward-char)
         (goto-char (point-min)))))

;;; 括弧の自動挿入
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))
(defun cperl-mode-hook--electric-pair ()
  (dolist (k '("\"" "\'" "(" "[" "{"))
    (define-key cperl-mode-map k 'electric-pair)))
(add-hook 'cperl-mode-hook 'cperl-mode-hook--electric-pair)

;;; tab/indent設定
(defun cperl-mode-hook--indent ()
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (set (make-local-variable 'tab-stop-list)
       '(4 8 12 16 20 24 28 32 36 40)))
(add-hook 'cperl-mode-hook 'cperl-mode-hook--indent)

;;; fly-check
(add-hook 'cperl-mode-hook 'flycheck-mode)
