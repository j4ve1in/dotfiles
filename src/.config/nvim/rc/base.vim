" base
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
set scrolloff=5
set winheight=8
set shortmess+=I
set iskeyword+=.,#,-
set tags+=.git/tags
set virtualedit=block
set inccommand=nosplit
set grepprg=grep\ -inH
set completeopt=menuone
set ignorecase smartcase
set whichwrap=b,~,[,],<,>
set wildignorecase wildmode=longest:full,full

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

" apperance
set ruler
set number
set showmatch
set noshowmode
set matchtime=1
colorscheme abyss
scriptencoding utf-8
let &showbreak="\u21aa "
set list listchars=tab:▸\ ,trail:˽,eol:¬,extends:>,precedes:<,nbsp:%

augroup tabline
  autocmd!
  autocmd VimEnter let &tabline = '%!'. tabline#sid() . 'tabline#name()'
augroup END

augroup nohlsearch
  autocmd!
  autocmd InsertEnter * let b:_search=@/|let @/=''
  autocmd InsertLeave * let @/=get(b:,'_search','')
augroup END

" File
"" Indent
augroup file_type_indent
  autocmd!
  autocmd FileType * setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent
  autocmd FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
  autocmd FileType sxhkdrc setlocal noexpandtab

  autocmd FileType man setlocal tabstop=8
augroup END

"" Terminal
augroup file_type_term_run
  autocmd!
  autocmd FileType zsh nnoremap <silent> <buffer> <C-c> :<C-u>call term#run('zsh')<CR>
  autocmd FileType bash nnoremap <silent> <buffer> <C-c> :<C-u>call term#run('bash')<CR>
augroup END

"" Template
augroup file_type_template
  autocmd!
  autocmd BufNewFile *.* silent! call skel#load()
augroup END
