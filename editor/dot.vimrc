" Runtimepath
set runtimepath+=~/

" Plugins
runtime .vimrc.plugin.d/netrw.rc.vim
runtime .vimrc.plugin.d/neobundle.rc.vim

" Others
runtime! .vimrc.d/*.rc.vim

let g:unite_enable_start_insert = 1
let g:unite_enable_auto_select = 0
call unite#custom#profile('default', 'context', {
  \ 'prompt_direction': 'top',
  \ 'prompt': '> ',
  \ 'candidate_icon': '- ',
  \ 'hide_icon': 0 })
