;; bash設定---------------------------------------------->
(when (require 'bash-completion nil t)
  (bash-completion-setup))
;; shell-script-mode解説
;; 前提 : anything + auto-complete有効にしておく
;; <shell宣言> C-c: => (sh-set-shell)
;; <構文入力支援:case文> C-c C-c => (sh-case)
;; <構文入力支援:for文> C-c C-f => (sh-for)
;; <構文入力支援:select文> C-c C-s => (sh-select) ※/bin/bashであること前提
;; <構文入力支援:if文> C-c C-i => (sh-if)
;; <構文入力支援:until文> C-c C-u => (sh-until)
;; <構文入力支援:while文> C-c C-w => (sh-while)
;; <構文入力支援:loop文> C-c C-l => (sh-loop)
;; <構文入力支援:1を足す> C-c + => (sh-add)
;; <構文入力支援:引数に応じた処理> C-c C-o => (sh-while-getopts)
;; <構文入力支援:関数> C-c (  => (sh-function)
;; <実行支援:実行> C-c C-x => (executable-interpret)
;; <構文支援:部分実行> C-M-x => (sh-execute-region)
;; <その他入力支援:tempファイル作成> C-c C-t => (sh-tmp-file)
;; <regionされた書く行末にバックスペース> C-c C-\ => (sh-backslash-region)
(add-hook 'shell-mode-hook
          '(lambda ()
             (flymake-mode t)))
