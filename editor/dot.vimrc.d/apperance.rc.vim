set wrap

set linespace=4

set laststatus=2

set showmatch

set showcmd

set number

set tabstop=4

set ruler

set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
hi NonText ctermfg=239


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
