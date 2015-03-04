set backspace=indent,eol,start " オートインデント、改行、インサートモード開始直後にバックスペースキーで削除できるようにする


set hidden " バッファを保存しなくてもほかのバッファを表示できるようにする

set clipboard+=unnamed "クリップボードを共有する

set virtualedit=block "ビジュアルブロックモードでフリーカーソルを有効にする

set noerrorbells "エラー音を無効にする

set novisualbell "ビジュアルベルを無効にする

set whichwrap=b,s,[,],<,> "左右のカーソル移動で行間の移動を可能にする

au BufRead,BufNewFile *.md set filetype=markdown " .mdをファイルタイプをmarkdownにする

au BufRead,BufNewFile *.zshrc set filetype=zsh " .zshrcをファイルタイプをzshにする

au BufRead,BufNewFile *.bashrc set filetype=sh " .bashrcをファイルタイプをshにする

" 文字コードの自動認識

set encoding=utf-8 " vimの内部で使用されるエンコーディングを指定する

set fileformats=unix,dos,mac

set termencoding=utf-8 " ターミナルの出力に用いられるエンコーディングを指定する

if exists('&ambiwidth')
  set ambiwidth=double
endif

" swapファイル
set swapfile
set directory=~/.vim/tmp/swap " swapファイルの作成場所の指定


" backupファイル
set backup
set backupdir=~/.vim/tmp/backup " backupファイルの作成場所の指定


" undoファイル
set undofile
set undodir=~/.vim/tmp/undo " undoファイルの作成場所の指定


" マウス
set mouse=a " マウス操作を有効にする

set ttymouse=xterm2 " ドラッグを有効にする
