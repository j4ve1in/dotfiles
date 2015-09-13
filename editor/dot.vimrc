" Declare rc_vim_list and source_rc
let rc_vim_list = [
\   "plugins",
\   "apperance",
\   "base",
\   "colors",
\   "keymap"
\ ]

function! s:source_rc(path)
  execute 'source' fnameescape(expand('~/.vimrc.d/' . a:path . '.rc.vim'))
endfunction

" Source settings
" Location:
"   ~/.vimrc.d/plugins.rc.vim
"   ~/.vimrc.d/apperance.rc.vim
"   ~/.vimrc.d/base.rc.vim
"   ~/.vimrc.d/colors.rc.vim
"   ~/.vimrc.d/keymap.rc.vim
for rc_vim in rc_vim_list
  cal s:source_rc(rc_vim)
endfor
