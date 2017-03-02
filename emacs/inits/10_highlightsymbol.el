;; 現在位置のsymbolのハイライトをtoggleする
;; highlight-symbol
;; F3二度押でキャンセル
(require 'highlight-symbol)
;;(setq highlight-symbol-colors '("DodgerBlue1" "DeepPink1"))
(global-set-key (kbd "<f3>") 'highlight-symbol-at-point)
