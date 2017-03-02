########################################
# 環境変数
export LANG=ja_JP.UTF-8

ulimit -c 0

# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
%# "

# 色の設定
local DEFAULT=$'%{^[[m%}'$
local RED=$'%{^[[1;31m%}'$
local GREEN=$'%{^[[1;32m%}'$
local YELLOW=$'%{^[[1;33m%}'$
local BLUE=$'%{^[[1;34m%}'$
local PURPLE=$'%{^[[1;35m%}'$
local LIGHT_BLUE=$'%{^[[1;36m%}'$
local WHITE=$'%{^[[1;37m%}'$

# タブタイトルにカレントディレクトリのフォルダ名を表示
# echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
# function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}
function changetitle {
    current_dir=`pwd | sed -e "s%\(/\([^.]\|\..\)\)[^/]*%\1%g"``pwd | sed -e "s%^.*/\([^.]\|\..\)\([^/]*\)$%\2%"`
    title=[${USER}@${HOST%%.*}]${current_dir}
    case "${TERM}" in
        xterm*|kterm*|rxvt*)
            echo -ne "\033]0;${title}\007"
            ;;
        screen*)
            echo -ne "\033P\033]0;${title}\007\033\\"
            ;;
    esac
}
changetitle
function chpwd() {
      changetitle
}
preexec () {
      changetitle
}

# コマンド修正
setopt correct
setopt correct_all

# コマンド存在せずディレクトリに cd
setopt auto_cd

# ディレクトリの履歴
setopt auto_pushd
setopt pushd_ignore_dups

# 古いほうのコマンドを履歴削除
setopt hist_ignore_all_dups

# コマンドがスペース、コマンド履歴に追加しない
setopt hist_ignore_space

# 補完キー連打
setopt auto_menu

# Beep不要
setopt no_beep
setopt no_list_beep

# プロンプトに設定している'%~'やcdコマンドの'~'での補完反映
setopt auto_name_dirs

# 必要に応じてスラッシュを除去する
setopt auto_remove_slash

# 補完のときプロンプトの位置変更しない
setopt always_last_prompt

# 変数の単語分割
setopt sh_word_split

# Ctrl-s, Ctrl-q によるフロー制御を無効にする
setopt no_flow_control

# 履歴共有
setopt share_history

# バックグラウンドジョブが終了時の報告
setopt notify


########################################
# 補完
# 自動補完を有効にする
autoload -U compinit; compinit -u

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# zsh-completions設定
# brew install zsh-completions
if [ -e /usr/local/share/zsh-completions ]; then
        fpath=(/usr/local/share/zsh-completions $fpath)
fi

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' use-cache true
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'



########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
if which pbcopy >/dev/null 2>&1 ; then
        # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
        # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
        # Cygwin
    alias -g C='| putclip'
fi



########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
                #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
                #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac



#######################################
# git
# ブランチ名を表示する
function __git_branch() {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\:\1/'
      }
alias gbn=__git_branch

########################################
# peco の設定
# % brew install peco
function peco-history-selection() {
        BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
            CURSOR=$#BUFFER
                zle reset-prompt
                }

zle -N peco-history-selection
bindkey '^R' peco-history-selection



#######################################
# 他
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
