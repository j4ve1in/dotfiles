set hidden

set ttyfast

set autoread

set nrformats=

set scrolloff=5

set display=lastline

set virtualedit=block

set clipboard+=unnamed

set whichwrap=b,s ",[,],<,>

set backspace=indent,eol,start

set noerrorbells visualbell t_vb=

set viminfo='50,\"1000,n~/.vim/var/tmp/.viminfo

autocmd FileType *  setlocal formatoptions-=ro

autocmd FileType man setlocal nospell ts=8 nolist ro nomod noma

if exists('&ambiwidth')
  set ambiwidth=double
endif

if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" Completion
set wildmenu wildmode=list:full

" Indent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent

" Search
set wrapscan ignorecase smartcase incsearch hlsearch

" Swapfile
set swapfile directory=~/.vim/tmp/swap

" Backupfile
set backup backupdir=~/.vim/var/tmp/backup

" Undofile
set undofile undodir=~/.vim/var/tmp/undo

" Mouse
set mouse=a ttymouse=xterm2
