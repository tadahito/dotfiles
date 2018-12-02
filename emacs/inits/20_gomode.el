;; go設定---------------------------------------------->
;; 前提
;; go get github.com/rogpeppe/godef
;; go get -u github.com/nsf/gocode
;; go get github.com/golang/lint/golint
;; go get github.com/kisielk/errcheck
;; go get golang.org/x/tools/cmd/goimports

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; gofmt
(add-hook 'before-save-hook 'gofmt-before-save)

;; goimport
(setq gofmt-command "goimports")

;; gotest
(require 'gotest)
(setq go-test-verbose t)
(define-key go-mode-map (kbd "C-c C-t") 'go-test-current-file)
(define-key go-mode-map (kbd "C-c t") 'go-test-current-test)
(push '("\*Go Test\*" :regexp t :height 0.5 :stick t) popwin:special-display-config)
