set title " ウィンドウのタイトルバーにファイルのパス情報などを表示する

set wrap " 折り返し表示をする

set linespace=4 " 行間を設定する

set laststatus=2 " ステータスラインを表示する

set t_Co=256 " 256色表示する

syntax on " 構文ごとに色分けする

set showmatch " 括弧の対応をハイライトする

set showcmd " 入力途中のコマンドを画面最下行に表示する

set number " 行番号を表示する

set tabstop=4 "タブをスペース4つ分で表示する

set ruler " カーソルが何行目の何列目に置かれているかを表示する
" タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
hi NonText ctermfg=239


"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=blue gui=reverse guifg=blue
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif


