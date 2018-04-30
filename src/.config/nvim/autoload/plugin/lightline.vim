let s:white  = [ '#DDDDDD', 255 ]
let s:black  = [ '#000000', 0 ]
let s:red  = [ '#FE0000', 196 ]
let s:cyan  = [ '#00AFFF', 39 ]
let s:darkpurple  = [ '#5F0087', 54 ]

let s:blue  = [ '#0000C8', 21 ]
let s:darkblue  = [ '#00014E', 17 ]

let s:gray  = [ '#808080', 235 ]
let s:lightgray  = [ '#4C4C4C', 240 ]

let s:none  = [ 'NONE', 'NONE' ]

let s:p = {
\   'normal':   {},
\   'inactive': {},
\   'insert':   {},
\   'replace':  {},
\   'visual':   {},
\   'tabline':  {}
\ }

let s:p.normal.middle = [[s:white, s:black]]
let s:p.normal.left = [[s:white, s:darkblue], [s:white, s:blue]]
let s:p.normal.right = [[s:white, s:darkblue], [s:white, s:blue]]

let s:p.normal.error = [[ s:red, s:black ]]

let s:p.inactive.middle = [[s:white, s:black]]
let s:p.inactive.right = [[s:white, s:gray], [s:white, s:lightgray]]
let s:p.inactive.left = [[s:white, s:gray]]

let s:p.insert.left = [[s:darkblue, s:white], s:p.normal.left[1]]
let s:p.replace.left = [[s:white, s:cyan], s:p.normal.left[1]]
let s:p.visual.left = [[s:white, s:darkpurple], s:p.normal.left[1]]

let s:p.tabline.middle = [[s:white, s:none]]
let s:p.tabline.right = [[s:white, s:darkblue], [s:darkblue, s:none]]
let s:p.tabline.left = [[s:white, s:black]]
let s:p.tabline.tabsel = [[s:white, s:darkblue]]
let g:lightline#colorscheme#abyss#palette = lightline#colorscheme#flatten(s:p)

function! plugin#lightline#syntaxcheck() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '' : printf(
  \   "\uf05e %d \uf071 %d",
  \   all_errors,
  \   all_non_errors
  \)
endfunction

function! plugin#lightline#filename() abort
  if '' ==# expand('%:t')
    return '[No Name]'
  elseif &filetype ==# 'fzf'
    return '[Plugin]'
  else
    return expand('%:t')
  endif
endfunction

function! plugin#lightline#fileencoding() abort
  return winwidth(0) > 60 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

function! plugin#lightline#vcs() abort
  let l:mark = "\ue0a0 "
  let l:branch = fugitive#head()
  return winwidth(0) > 60 ? (strlen(l:branch) ? l:mark.l:branch : '') : ''
endfunction

function! plugin#lightline#fileformat() abort
  return winwidth(0) > 60 ? &fileformat : ''
endfunction

function! plugin#lightline#filetype() abort
  return strlen(&filetype) ? &filetype : '-'
endfunction
