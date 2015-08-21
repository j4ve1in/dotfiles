" Declare source_rc
function! s:source_rc(path)
  execute 'source' fnameescape(expand('~/.vimrc.d/' . a:path))
endfunction

" Source settings
"" Plugin
cal s:source_rc('plugins.rc.vim')

"" Others
cal s:source_rc('apperance.rc.vim')
cal s:source_rc('base.rc.vim')
cal s:source_rc('colors.rc.vim')
cal s:source_rc('keymap.rc.vim')
