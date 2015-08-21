set wrap

set showmatch

set matchtime=1

set showcmd

set number

set ruler

set fileformats=unix,dos,mac

" Encoding
set encoding=utf-8
scriptencoding utf-8
set termencoding=utf-8

" List
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
autocmd FileType man set nolist
hi NonText ctermfg=239

" Statusline
set laststatus=2
set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l/%L,%c%V%8P
function! g:Date()
    return strftime("%x %H:%M")
endfunction
set statusline+=\ \%{g:Date()}

" Hilighting double-byte space
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
