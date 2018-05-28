;; --------------------------------------------------
;; load-path & auto-install.el設定 % 前提設定
;; --------------------------------------------------

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
