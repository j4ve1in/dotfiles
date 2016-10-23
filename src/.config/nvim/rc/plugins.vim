" Dein
let s:dein_dir = expand('~/.local/share/nvim/dein')

if isdirectory(s:dein_dir)
  execute 'set runtimepath^=' . s:dein_dir

  " Load Plugins
  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    let s:toml = expand('~/.config/nvim/rc/plugins.toml')
    let s:lazy_toml = expand('~/.config/nvim/rc/plugins.lazy.toml')
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
    call dein#end()
    call dein#save_state()
  endif
  call dein#call_hook('source')
  call dein#call_hook('post_source')

  if has('vim_starting') && dein#check_install()
    call dein#install()
  endif
endif

" Netrw
let g:netrw_liststyle=3
let g:netrw_keepdir=0
let g:netrw_home=$HOME.'/.local/share/nvim'
"" Autostart
autocmd VimEnter * nested if @% == '' && s:bufByte() == 0 | Explore | endif
function! s:bufByte()
  return line2byte(line('$') + 1) == -1 ? 0 : -1
endfunction
