function! tabline#sid() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! tabline#name() abort
  let l:s = ''
  for l:i in range(1, tabpagenr('$'))
    let l:bufnrs = tabpagebuflist(l:i)
    let l:bufnr = l:bufnrs[tabpagewinnr(l:i) - 1] " first window, first appears
    let l:no = l:i " display 0-origin tabpagenr.
    let l:mod = getbufvar(l:bufnr, '&modified') ? '!' : ' '
    let l:title = fnamemodify(bufname(l:bufnr), ':t')
    let l:title = ' ' . l:title
    let l:s .= '%'.l:i.'T'
    let l:s .= '%#' . (l:i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let l:s .= l:no . ':' . l:title
    let l:s .= l:mod
    let l:s .= '%#TabLineFill# '
  endfor
  let l:s .= '%#TabLineFill#%T%=%#TabLine#'
  return l:s
endfunction
