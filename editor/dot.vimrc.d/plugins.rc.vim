" Declare source_rc_plugin
function! s:source_plugin_rc(path)
  execute 'source' fnameescape(expand('~/.vimrc.plugin.d/' . a:path))
endfunction

" Source plugin settings
cal s:source_plugin_rc('netrw.rc.vim')
cal s:source_plugin_rc('neobundle.rc.vim')
