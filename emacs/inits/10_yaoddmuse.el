;;; emacswikiへ公開
;; M-x emacswiki-post 一発で簡単に公開
(require 'yaoddmuse)
(setq yaoddmuse-wikis
        '(("EmacsWiki" "http://www.emacswiki.org/cgi-bin/emacs" utf-8 "uihnscuskc=1;")))
(setq yaoddmuse-username "YourName")
(setq yaoddmuse-directory "~/.emacs.d/yaoddmuse")
