;; --------------------------------------------------
;; emacs package管理
;; m-x list-package
;; --------------------------------------------------
;; ELPA/Marmalade/MELPAパッケージの設定
(when (require 'package nil t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  ;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (setq url-http-attempt-keepalives nil)) ; To fix MELPA problem.

;; 通信時間かかる時は、下記2行コメントアウト
(package-refresh-contents)
(package-initialize)