;; nxml-mode設定(html5未対応だが念のため)----------------------------->
;;; 自動的にタグとじ
(setq nxml-slash-auto-complete-flag t)
;;; M-tabでタグ補完
(setq nxml-bind-meta-tab-to-complete-flag t)
;;; nxml-modeでauto-complete-modeを利用する
;;; (add-to-list 'ac-modes 'nxml-mode)
;;; 子要素のインデント
(setq nxml-child-indent 0)
;;; 属性値のインデント
(setq nxml-attribute-indent 0)
