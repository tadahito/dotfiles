;; --------------------------------------------------
;; load-path & auto-install.el設定 % 前提設定
;; --------------------------------------------------
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; 各種読込dir
(add-to-load-path "elisp" "elpa")

;; init-loader読込(各種lisp読込)
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits/")
