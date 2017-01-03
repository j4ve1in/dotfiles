filetype off
filetype plugin indent off

" Cache
let $CACHE = expand('~/.cache')

if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

" Declare rc_vim_list and source_rc
let s:rc_vim_list = [
\   'local.before',
\   'plugins',
\   'base',
\   'keymap',
\   'local'
\ ]

" Source settings
" Location: ~/.config/nvim/rc/
for s:rc_vim in s:rc_vim_list
  cal source#rc(s:rc_vim)
endfor

filetype plugin indent on
