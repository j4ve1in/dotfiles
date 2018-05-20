let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

set hidden
set undofile
set winheight=8
set shortmess+=I
set iskeyword+=.,#,-
set tags+=.git/tags
set virtualedit=block
set inccommand=nosplit
set grepprg=grep\ -inH
set completeopt=menuone
set completeopt+=noinsert
set ignorecase
set smartcase
set whichwrap=b,~,[,],<,>
set wildignorecase
set wildmode=longest:full,full

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
