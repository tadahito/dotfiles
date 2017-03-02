;;; mew & gmail
;; (info "(mew.jis)configuration")
;; (defun mew-gmail-config (config account name)
;;   `(,config
;;     ("pop-ssl"      . t)
;;     ("pop-ssl-port" . "995")
;;     ("inbox-folder" . ,(format "+%s" account))
;;     ("name"        . ,name)
;;     ("user"        . ,account)
;;     ("mail-domain" . "gmail.com")
;;     ("pop-user"    . ,(format "%s@gmail.com" account))
;;     ("pop-server"  . "pop.gmail.com")
;;     ;; 証明書がインストールされているディレクトリ
;;     ("ssl-cert-directory" . "/etc/ssl/certs")
;;     ;; 証明書がインストールされていないときは以下のコメントを外す
;;     ("ssl-verify-level" . 0)
;;     ("smtp-ssl"     . t)
;;     ("smtp-ssl-port" . "465")
;;     ("smtp-user"    . ,(format "%s@gmail.com" account))
;;     ("smtp-server" . "smtp.gmail.com")))
;; ;;; yashiropost@gmail.comの場合
;; (setq mew-config-alist
;;       (list (mew-gmail-config 'default "yashiropost" "ty")))
;;; eshell-cmdline-stack
