;; ;;; ローマ字で日本語検索(migemo)
;; ;; 基本設定
;; (setq migemo-command "~/.emacs.d/edownload/cmigemo")
;; (setq migemo-options '("-q" "--emacs"))
;; ;; migemo-dict のパスを指定
;; (setq migemo-user-dictionary nil)
;; (setq migemo-regex-dictionary nil)
;; ;; キャッシュ機能を利用する
;; (setq migemo-use-pattern-alist t)
;; (setq migemo-use-frequent-pattern-alist t)
;; (setq migemo-pattern-alist-length 1024)
;; ;; 辞書の文字コードを指定．
;; ;; バイナリを利用するなら，このままで構わない
;; (setq migemo-coding-system 'euc-jp-unix)
;; (load-library "migemo")
;; ;; 起動時に初期化も行う
;; (migemo-init)
