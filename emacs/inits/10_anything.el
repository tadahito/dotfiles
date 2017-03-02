;; anything.el設定
;; anything-for-files => c-x c f   次の情報源 => C-o   閉じる => C-g   チラ見 => C-z
;; anything-action => tab => C-c ?
;; switch-to-buffer => C-x b
;; anything-imenu => c-x c i
;; anything-locate => C-x c l
;; anything-show-kill-ring => C-x c M-y(C-w 履歴探索)
;; tab => バッファ切替
;; anything-color => C-x c c
;; anything-occur => C-x c M-s o
;; anything-resume => buffer edit
;; ! => 含めない検索。2番目以降の検索後に有効
;; 2space => 検索後にスペース含むとき
;; anything-execute-anything-command(cmd確認) => C-x c SPC
;; <f1> b => key-bind確認
;;; anything設定
(require 'anything-startup)
(require 'anything-config)
(require 'anything-grep) ;; anything-grep
(defun anything-occur-x ()
  (interactive)
  (anything :sources 'anything-c-source-occur
            :buffer "*anything occur*"
            :candidate-number-limit nil))
(setq anything-idle-delay 0.2
      anything-input-idle-delay 0.2
      anything-quick-update t
      anything-enable-shortcuts 'alphabet)
(global-set-key (kbd "C-x b") 'anything-for-files)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
;;(global-set-key (kbd "M-o") 'anything-occur-x)
(global-set-key (kbd "C-x c g") 'anything-grep)
;; color-moccur.el設定(バッファ内を検索する)
(when (require 'color-moccur nil t)
  ;; M-oにoccur-by-moccurを割り当て
  ;;(define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; スペース区切りでAND検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索のとき除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  ;; Migemoを利用できる環境であればMigemoを使う
  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (setq moccur-use-migemo t)))

;; moccur-edit の設定
;; m-x moccur-grep-find
;; 検索
;; jで下ハイライト
;; kで上ハイライト
;; rで編集モード
;; C-x C-s => 保存をして終了
;; C-x C-k => 保存せずに終了
(when (require 'moccur-edit nil t)
  (global-set-key (kbd "M-o") 'moccur-grep-find))


;; anything-c-moccur.el設定(検索結果リストアップ)
(when (require 'anything-c-moccur nil t)
  (setq
   anything-c-moccur-anything-idle-delay 0.1
   anything-c-moccur-higligt-info-line-flag t
   anything-c-moccur-enable-auto-look-flag t
   anything-c-moccur-enable-initial-pattern t)
  (global-set-key (kbd "C-M-o") 'anything-c-moccur-occur-by-moccur))

;; 操作不明時の解消
(require 'descbinds-anything)
(descbinds-anything-install)

;; anything-grep(directory-grep)
(require 'anything-grep)
(require 'eshell)
(require 'esh-myparser)
(defun eshell-parser/ag (cmdline)
  (let ((grep-cmd (concat "grep -HEin " cmdline)))
    (anything-grep grep-cmd (eshell/pwd))
    (list "echo" grep-cmd)))
