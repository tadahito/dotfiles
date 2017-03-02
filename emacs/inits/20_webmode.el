;;; web-mode(html5, js, css)----------------------------->
;;; c-c c-n 開始終了タグ移動
;;; c-c c-f タグ閉じ開き処理
;;; c-c c-r なぜか無効状態
(when (require 'web-mode nil t)
  ;; 行末の空白削除
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  ;;; emacs 23以下の互換
  (when (< emacs-major-version 24)
    (defalias 'prog-mode 'fundamental-mode))
  ;;; 適用する拡張子
  (add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?$"     . web-mode))
  ;;; インデント数
  (defun web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-attr-indent-offset nil)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-sql-indent-offset 2)
    (setq indent-tabs-mode nil)
    (setq tab-width 2))
  (add-hook 'web-mode-hook 'web-mode-hook)
  ;;色の設定
  (custom-set-faces
   '(web-mode-doctype-face
     ((t (:foreground "#82AE46"))))
   '(web-mode-html-tag-face
     ((t (:foreground "#E6B422" :weight bold))))
   '(web-mode-html-attr-name-face
     ((t (:foreground "#C97586"))))
   '(web-mode-html-attr-value-face
     ((t (:foreground "#82AE46"))))
   '(web-mode-comment-face
     ((t (:foreground "#D9333F"))))
   '(web-mode-server-comment-face
     ((t (:foreground "#D9333F"))))
   '(web-mode-css-rule-face
     ((t (:foreground "#A0D8EF"))))
   '(web-mode-css-pseudo-class-face
     ((t (:foreground "#FF7F00"))))
   '(web-mode-css-at-rule-face
     ((t (:foreground "#FF7F00"))))))
