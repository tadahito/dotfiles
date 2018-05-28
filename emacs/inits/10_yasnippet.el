;;;; yasnippet の設定
;; (add-to-list 'load-path
;;              (expand-file-name "~/.emacs.d/elpa/yasnippet"))
;; (require 'yasnippet)
;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/elpa/yasnippet/snippets"))
;; (yas-global-mode 1)
;; (custom-set-variables '(yas-trigger-key "TAB"))

;;;; 既存スニペット挿入
;; (define-key yas-minor-mode-map (kbd "C-c i") 'yas-insert-snippet)
;;;; 新規スニペットを作成するバッファ準備
;; (define-key yas-minor-mode-map (kbd "C-c n") 'yas-new-snippet)
;;;; 既存スニペット閲覧/編集
;; (define-key yas-minor-mode-map (kbd "C-c v") 'yas-visit-snippet-file)
;;;; 実際のコードをスニペット化
;; (define-key yas-minor-mode-map (kbd "C-c c") 'yas/new-snippet-with-content)
