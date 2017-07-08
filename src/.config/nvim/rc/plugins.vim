" Dein
let s:nvim_cache_home = $XDG_CACHE_HOME . '/nvim'
let s:nvim_config_home = $XDG_CONFIG_HOME . '/nvim'
let s:nvim_plugin_home = $XDG_DATA_HOME . '/nvim/plugins'
let s:dein_home = s:nvim_plugin_home . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_home) && !filereadable(s:nvim_cache_home . '/plugin')
  execute '!touch ' . s:nvim_cache_home . '/plugin'
  let s:result = confirm('Install neovim plugins?', "&Yes\n&No", '2')
  if s:result == 1
    execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_home
  endif
endif

if isdirectory(s:dein_home)
  execute 'set runtimepath^=' . s:dein_home

  " Load Plugins
  if dein#load_state(s:dein_home)
    call dein#begin(s:nvim_plugin_home)
    call dein#load_toml(s:nvim_config_home . '/rc/plugins.toml',      {'lazy': 0})
    call dein#load_toml(s:nvim_config_home . '/rc/plugins.lazy.toml', {'lazy': 1})
    call dein#end()
    call dein#save_state()
  endif
  call dein#call_hook('source')
  call dein#call_hook('post_source')

  if has('vim_starting') && dein#check_install()
    call dein#install()
  endif
endif
