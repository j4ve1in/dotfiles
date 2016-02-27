set hidden

set ttyfast

set autoread

set history=50

set nrformats=

set scrolloff=5

set display=lastline

set virtualedit=block

set clipboard+=unnamed

set whichwrap=b,~,[,],<,>

set backspace=indent,eol,start

set noerrorbells visualbell t_vb=

set viminfo='30,<50,s100,n~/.vim/viminfo

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
set swapfile directory=~/.vim/swap

" Backupfile
set backup backupdir=~/.vim/backup

" Undofile
set undofile undodir=~/.vim/undo

" Mouse
set mouse=a ttymouse=xterm2
