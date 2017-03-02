" -----------------------------------------------------------------------
" my settings

"タブによる補完機能を可能にする。
set nocompatible

" display number
set number

" make nowrapscan
set nowrapscan

" make nobackup
set nobackup

" make noswapfile
set noswapfile

"自動的にインデントする
set autoindent

"高度な自動インデントする
set smartindent

"標準タブは2
set tabstop=2


"挿入モードでのインデント
set shiftwidth=2
set softtabstop=2
set noexpandtab
set smarttab

"タブ入力を空白文字に置き換える
set expandtab


" 内部の解釈の文字コード　設定ファイルもこのコードで書け
set encoding=utf-8

" 内部の改行コード
set fileformat=unix

" 対応括弧の瞬間強調時間
set matchtime=4

" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed

"vim上で文字を選択しただけでクリップボードコピー
set guioptions+=a

"ルーラーを表示
set ruler
set title

"とりあえずscheme指定でザックリ指定
colorscheme default

" 検索
set incsearch

" 下線
set cursorline

"ファイルタイプ検出
filetype plugin indent on

"括弧閉じ挿入
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"クリップボード使う
set clipboard=unnamed,autoselect

"escと同じ
inoremap <C-c> <Esc>

"検索結果ハイライト
set hlsearch

"バックスペース有効
set backspace=indent,eol,start

"括弧の入力時にカーソルを対応する括弧の上に一定時間表示させる
set showmatch
set matchtime=5

"vimコマンド履歴
set history=100

"入力途中のvimコマンドを右下に表示
set showcmd

"バックアップファイル用ディレクトリ
set backupdir=$HOME/backup

"大文字小文字検索無視
set ignorecase

"検索時にファイルの最後まで言ったら最初に戻らないようにする
set wrapscan

"エクスプローラーで開く時のディレクトリ
set browsedir=buffer

"vim日本語ヘルプ
helptags ~/.vim/doc/

"行末の余分な改行コード(^M)削除
"%s/^M//g

"保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//e

"矩形選択自由範囲移動
set virtualedit+=block






"************************************************************
" 色設定
"************************************************************

"syntax color on/pff
syntax enable
syntax on






"************************************************************
" 補完設定
"************************************************************

"補完候補表示
set wildmenu


"jsファイル読み込み時はjs補完辞書をread
autocmd FileType html :set dictionary=~/.vim/dic/html.dict
autocmd FileType html :set dictionary=~/.vim/dic/javascript.dict
autocmd FileType javascript :set dictionary=~/.vim/dic/javascript.dict
autocmd FileType html :set dictionary=~/.vim/dic/javascript.dict
autocmd FileType css :set dictionary=~/.vim/dic/css.dict
autocmd FileType perl :set dictionary=~/.vim/dic/perl.dict
autocmd FileType ruby :set dictionary=~/.vim/dic/ruby.dict

" "" 最初のマッチのみを補完する。
" "full"
" 次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び最初のマッチが補完される
" "longest"
" 共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次の候補に移る
" "longest:full"  "longest" と似ているが、'wildmenu'
" が有効ならばそれを開始する
" "list"          複数のマッチがあるときは、全てのマッチを羅列する。
" "list:full"
" 複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する
" "list:longest"
" 複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完される
set wildmode=list:longest,full



"************************************************************
" 各PLUGIN
"************************************************************



"************************************************************
" 各vim script
"************************************************************

