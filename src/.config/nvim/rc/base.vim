set hidden
set undofile
set winheight=8
set shortmess+=I
set tags=.git/tags;~
set inccommand=nosplit
set completeopt=menuone
set completeopt+=noinsert
set ignorecase
set smartcase
set wildignorecase
set wildmode=longest:full,full
set nostartofline

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

if $DISPLAY !=# ''
  set clipboard=unnamedplus
endif

augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost make,*grep* cwindow
augroup END

augroup im
  autocmd!
  autocmd InsertLeave * call im#fcitx()
augroup END

augroup template
  autocmd!
  autocmd BufNewFile *.* silent! call skel#load()
augroup END

autocmd BufWinEnter,WinEnter term://* startinsert
augroup terminal
  autocmd!
  autocmd TermOpen term://* startinsert
augroup END
