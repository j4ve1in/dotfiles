set hidden
set mouse=
set undofile
set scrolloff=5
set winheight=8
set tags+=.git/tags
set virtualedit=block
set grepprg=grep\ -inH
set completeopt=menuone
set ignorecase smartcase
set whichwrap=b,~,[,],<,>
set wildignorecase wildmode=longest:full,full
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost make,*grep* cwindow
augroup END

" apperance
set ruler
set number
set showmatch
set noshowmode
set matchtime=1
scriptencoding utf-8
let &showbreak="\u21aa "
set list listchars=tab:\ ,trail:˽,eol:¬,extends:>,precedes:<,nbsp:%
augroup tabline
  autocmd!
  autocmd VimEnter let &tabline = '%!'. tabline#sid() . 'tabline#name()'
augroup END

" clipboard
if $DISPLAY !=# ''
  set clipboard=unnamedplus
endif

" File
"" Base
augroup file_type_base
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType man setlocal nospell nolist readonly nomodified nomodifiable
augroup END

"" Indent
augroup file_type_indent
  autocmd!
  autocmd FileType * setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent
  autocmd FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

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
  autocmd BufNewFile *.* silent! execute '0r $NVIM_CONFIG_HOME/templates/skel.' . expand("<afile>:e") . ' | $normal ddgg'
augroup END
