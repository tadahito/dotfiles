;; --------------------------------------------------
;; emacs package管理
;; m-x list-package
;; --------------------------------------------------

;; https://blog.vifortech.com/posts/emacs-tls-fix/
;; => before install, brew install libressl
(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")

;; ELPA/Marmalade/MELPAパッケージの設定
(when (require 'package nil t)
  ;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  ;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
  (setq url-http-attempt-keepalives nil)) ; To fix MELPA problem.

;; 通信時間かかる時は、下記コメントアウト
(package-refresh-contents)
