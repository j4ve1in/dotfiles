function! skel#load() abort
  if getline(1) !=# ''
     %delete _ " for editorconfig
  endif
  let l:skel = $XDG_CONFIG_HOME . '/nvim/templates/skel.'
  execute '0r ' . l:skel . expand('<afile>:e') . ' | $normal ddgg'
endfunction
