;;; eshell設定
(require 'esh-myparser)
(require 'shell-pop)
(require 'eshell-pop)
(require 'esh-cmdline-stack)
(global-set-key (kbd "C-x C-z") 'shell-pop)
(setq shell-pop-window-height 150) ; ウインドウサイズ
;; 拡張設定
;; 表:eshell操作方法のまとめ
;; | キー    | 解説                                |
;; |---------+-------------------------------------|
;; | C-p     | 前の履歴を取り出す / 前の行へ       |
;; | C-n     | 後の履歴を取り出す / 後の行へ       |
;; | RET     | コマンド実行                        |
;; | M-q     | コマンドラインスタック              |
;; | M-p     | 前の履歴を取り出す                  |
;; | M-n     | 後の履歴を取り出す                  |
;; | C-w     | 直前の単語を削除 / リージョンをキル |
;; | C-a     | コマンドラインの行頭へ              |
;; | C-c C-c | コマンドを強制終了                  |
;; | C-c C-d | EOFを送信                           |
;; | C-c C-e | コマンドラインを最下行に持っていく  |
;; | C-c C-l | 履歴を一覧表示                      |
;; | C-c C-m | 現在のコマンドラインをコピー        |
;; | C-c C-p | 前のコマンドラインへ                |
;; | C-c C-n | 後のコマンドラインへ                |
;; | C-c C-u | コマンドラインをキル                |
;; | C-c C-y | 直前の引数をコピー                  |
;; | C-c C-r | 直前のコマンド出力の先頭へ          |
;; | <f1> b  | help                                |
(progn
  (defun eshell-in-command-line-p ()
    (<= eshell-last-output-end (point)))
  (defmacro defun-eshell-cmdline (key &rest body)
    (let ((cmd (intern (format "eshell-cmdline/%s" key))))
      `(progn
         (add-hook 'eshell-mode-hook
                   (lambda () (define-key eshell-mode-map (read-kbd-macro ,key) ',cmd)))
         (defun ,cmd ()
           (interactive)
           (if (not (eshell-in-command-line-p))
               (call-interactively (lookup-key (current-global-map) (read-kbd-macro ,key)))
             ,@body)))))
  (defun eshell-history-and-bol (func)
    (delete-region eshell-last-output-end (point-max))
    (funcall func 1)
    (goto-char eshell-last-output-end)))
(defun-eshell-cmdline "C-w"
  (if (eq (point-max) (point))
      (backward-kill-word 1)
    (kill-region (region-beginning) (region-end))))
(defun-eshell-cmdline "C-p"
  (let ((last-command 'eshell-previous-matching-input-from-input))
    (eshell-history-and-bol 'eshell-previous-matching-input-from-input)))
(defun-eshell-cmdline "C-n"
  (let ((last-command 'eshell-previous-matching-input-from-input))
    (eshell-history-and-bol 'eshell-next-input)))
(defadvice eshell-send-input (after history-position activate)
  (setq eshell-history-index -1))
(defun-eshell-cmdline "C-u"
  (eshell-bol)
  (if (= (point-max) (point))
      (universal-argument)
    (end-of-line)
    (eshell-kill-input)))
(progn
  (defun eshell-new ()
    (interactive)
    (eshell t))
  (defun eshell-mode-hook0 ()
    (define-key eshell-mode-map "\C-c\C-z" 'eshell-new))
    (add-hook 'eshell-mode-hook 'eshell-mode-hook0))
