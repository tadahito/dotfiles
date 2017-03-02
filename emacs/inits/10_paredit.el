;;;括弧の対応を保持して編集する設定
;; 以下elisp編集コマンド
;; | コマンド | 解説 |
;; |----------+--------------------|
;; | C-M-f | 次のS式へ移動する |
;; | C-M-b | 前のS式へ移動する |
;; | C-M-d | リストの内側へ入る |
;; | C-M-u | リストの外側へ出る |
;; | C-M-SPC | S式をマークする |
;; | C-M-k | S式をカットする |
;; | C-M-t | S式を入れ替える |
;; | M- ( | 括弧で囲む |
;; | M-s | 括弧を外す |)
(when (require 'paredit nil t)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
  (add-hook 'lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'ielm-mode-hook 'enable-paredit-mode))
