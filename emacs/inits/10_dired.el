;;; dired設定
;;; c-x c-f でも可能
;;; c-x d の場合、ワイルドカードが利用可能
;;; c-x d ~/*.txt
;; diredで理解すべき操作下記3点
;; 1. diredを開く
;; 2. 複数のファイルをマークすること(m or u  マーク or アンマーク)
;; 3. diredからeshellを呼び出す
;; マークしたファイルがあるdiredバッファに戻り、「!」を押す
;; すると、瞬時にeshellが立ち上がり、先程マークされたファイル名が貼り付けられる
;; 「!」の代わりに「C-u !」としたときは、フルパスが貼り付けられる
(require 'dired)
(defun dired-start-eshell (arg)
  "diredで選択されたファイル名がペーストされた状態で、eshellを起動する。"
  (interactive "P")
  (let ((files (mapconcat 'shell-quote-argument
                          (dired-get-marked-files (not arg))
                          " ")))
    (if (fboundp 'shell-pop) (shell-pop) (eshell t))
    (save-excursion (insert " " files))))
(define-key dired-mode-map [remap dired-do-shell-command] 'dired-start-eshell)
;; wdired設定
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;; r => wdired実行
;; C-c C-c => 反映実行
;; C-c C-k => 変更取消
;; 置換例)M-% .txt RET .org RET !
;; 反映後diredに戻る
;; 表:ファイル操作のdiredコマンド
;; | コマンド | 機能           |
;; |----------+----------------|
;; | C(大文字)| コピー         |
;; | R(大文字)| 移動 (リネーム) |
;; | D(大文字)| 削除           |


;; diredでファイル名のみ表示
;; ( => ファイル名のみ表示
;; ) => 詳細情報も表示
(require 'dired-details)
(dired-details-install)
(setq dired-details-hidden-string "")

;;; joseph-single設定
;;; diredバッファを常にひとつにする
(require 'joseph-single-dired)
(eval-after-load 'dired '(require 'joseph-single-dired))

;;; diredをエキス付ローラのように操作する
;;; dired-view.el
;; (require 'dired)
(require 'dired-view)
(add-hook 'dired-mode-hook 'dired-view-minor-mode-on)
(define-key dired-mode-map (kbd ":") 'dired-view-minor-mode-dired-toggle)

;; diredをcolorFul
(require 'dired-filetype-face)
