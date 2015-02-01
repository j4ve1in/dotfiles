set wrap " Lines longer than the width of the window will wrap and displaying continues on the next line.

set linespace=4 " Number of pixel lines inserted between characters.

set laststatus=2 " the last window will always have a status line

set showmatch " 括弧の対応をハイライトする

set showcmd " 入力途中のコマンドを画面最下行に表示する

set number " 行番号を表示する

set tabstop=4 "タブをスペース4つ分で表示する

set ruler " カーソルが何行目の何列目に置かれているかを表示する
" タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
hi NonText ctermfg=239


" 全角スペースをハイライト表示
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
