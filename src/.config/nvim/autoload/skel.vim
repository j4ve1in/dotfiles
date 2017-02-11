function! skel#load() abort
  let l:skel = $NVIM_CONFIG_HOME . '/templates/skel.'
  execute '0r  ' . l:skel . expand('<afile>:e') . ' | $normal ddgg'
endfunction
