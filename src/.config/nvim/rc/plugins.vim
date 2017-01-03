" Dein
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
