" Netrw
let g:netrw_liststyle=3
let g:netrw_keepdir=0
let g:netrw_home=$HOME.'/.vim/tmp'

" Dein
let s:dein_dir = expand('~/.vim/bundle')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if isdirectory(s:dein_repo_dir)
  execute 'set runtimepath^=' . s:dein_repo_dir

  " Load Plugins
  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    let s:toml = expand('~/.vim/rc/plugins.toml')
    let s:lazy_toml = expand('~/.vim/rc/plugins.lazy.toml')
    call dein#load_toml(s:toml)
    call dein#load_toml(s:lazy_toml, {'lazy' : 1})
    call dein#end()
    call dein#save_state()
  endif

  if has('vim_starting') && dein#check_install()
    call dein#install()
  endif
endif
