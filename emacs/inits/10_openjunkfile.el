;;;試行錯誤用ファイルを開くための設定
(when (require 'open-junk-file nil t)
  ;; C-x C-zで試行錯誤ファイルを開く
  (global-set-key (kbd "C-x z") 'open-junk-file))
