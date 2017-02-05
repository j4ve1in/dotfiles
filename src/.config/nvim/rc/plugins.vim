" Dein
if !isdirectory($DEIN_HOME) && !filereadable($NVIM_CACHE_HOME . '/plugin')
  execute '!touch ' . $NVIM_CACHE_HOME . '/plugin'
  let s:result = confirm('Install neovim plugins?', "&Yes\n&No", '2')
  if s:result == 1
    execute '!git clone https://github.com/Shougo/dein.vim ' . $DEIN_HOME
  endif
endif

if isdirectory($DEIN_HOME)
  execute 'set runtimepath^=' . $DEIN_HOME

  " Load Plugins
  if dein#load_state($DEIN_HOME)
    call dein#begin($NVIM_PLUGIN_HOME)
    call dein#load_toml($NVIM_CONFIG_HOME . '/rc/plugins.toml',      {'lazy': 0})
    call dein#load_toml($NVIM_CONFIG_HOME . '/rc/plugins.lazy.toml', {'lazy': 1})
    call dein#end()
    call dein#save_state()
  endif
  call dein#call_hook('source')
  call dein#call_hook('post_source')

  if has('vim_starting') && dein#check_install()
    call dein#install()
  endif
endif
