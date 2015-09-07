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
  function! DispatchUniteFileRecAsyncOrGitTab()
    if isdirectory(getcwd()."/.git")
      Unite file_rec/git -default-action=tabopen
    else
      Unite file_rec/async -default-action=tabopen
    endif
  endfunction
  let s:unite_ignore_patterns='\.\(gif\|jpe\?g\|png\|webp\)$'
  call unite#custom#source('file_rec/async', 'ignore_pattern', s:unite_ignore_patterns)
  call unite#custom#source('file_rec/git', 'ignore_pattern', s:unite_ignore_patterns)

  " NeoBundle
  let neobundle_toggle = { 'is_selectable': 1 }
  function! neobundle_toggle.func(candidates)
    for candidate in a:candidates
      let bundle = candidate.action__bundle_name
      let cmd = neobundle#is_sourced(bundle) ?
      \ 'NeoBundleDisable ' : 'NeoBundleSource '
      exec cmd . bundle
    endfor
  endfunction
  call unite#custom#action('neobundle', 'source', neobundle_toggle)
  call unite#custom#default_action('neobundle', 'source')
  " }}}

  " vim-submode " {{{
  call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
  call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
  call submode#map('winsize', 'n', '', '>', '<C-w>>')
  call submode#map('winsize', 'n', '', '<', '<C-w><')
  call submode#map('winsize', 'n', '', '+', '<C-w>-')
  call submode#map('winsize', 'n', '', '-', '<C-w>+')
  call submode#enter_with('ex-move', 'nv', '', '<Space><Space>', '<Nop>')
  call submode#leave_with('ex-move', 'nv', '', '<Space>')
  call submode#map('ex-move', 'nv', '', 'j', '<C-f>zz')
  call submode#map('ex-move', 'nv', '', 'k', '<C-b>zz')
  call submode#map('ex-move', 'nv', '', 'n', '5jzz')
  call submode#map('ex-move', 'nv', '', 'm', '5kzz')
  call submode#map('ex-move', 'nv', '', 'l', '}zz')
  call submode#map('ex-move', 'nv', '', 'h', '{zz')
  " }}}

  " VimFiler " {{{
  call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
  " }}}

  filetype plugin indent on

  NeoBundleCheck
endif
