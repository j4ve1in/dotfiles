if !1 | finish | endif

" NeoBundle
if isdirectory(expand('~/.vim/bundle/neobundle.vim'))
  set runtimepath+=~/.vim/bundle/neobundle.vim/

  let g:neobundle#log_filename = $HOME.'/.vim/var/tmp/plugin/neobundle.log'

  call neobundle#begin(expand('~/.vim/bundle/'))

  source ~/.vimrc.plugin.d/neobundle.list.rc.vim

  call neobundle#end()

  " Unite " {{{
  call unite#custom#profile('default', 'context', {
    \ 'prompt_direction': 'top',
    \ 'prompt': '> ',
    \ 'candidate_icon': '- ',
    \ 'hide_icon': 0 })

  " ignore patterns
  function! DispatchUniteFileRecAsyncOrGit()
    if isdirectory(getcwd()."/.git")
      Unite file_rec/git
    else
      Unite file_rec/async
    endif
  endfunction

  let s:unite_ignore_patterns='\.\(gif\|jpe\?g\|png\|webp\)$'

  call unite#custom#source('file_rec/async', 'ignore_pattern', s:unite_ignore_patterns)
  call unite#custom#source('file_rec/git', 'ignore_pattern', s:unite_ignore_patterns)
  " }}}

  filetype plugin indent on

  NeoBundleCheck
endif
