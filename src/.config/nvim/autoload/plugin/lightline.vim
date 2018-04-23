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
  \   all_non_errors,
  \   all_errors
  \)
endfunction

function! plugin#lightline#percent() abort
  if &filetype ==# 'dirvish' || &filetype ==# 'denite'
    return ''
  else
    let l:line = line('.')
    let l:max_line = line('$')
    return printf('%3d%s', (l:line * 100 / l:max_line), '%')
  endif
endfunction

function! plugin#lightline#lineinfo() abort
  if &filetype ==# 'dirvish'
    return ''
  elseif &filetype ==# 'denite'
    return denite#get_status_linenr()
  else
    let l:line = line('.')
    let l:max_line = line('$')
    let l:col = col('.')
    return printf('%3d[%d]:%-2d', l:line, l:max_line, l:col)
  endif
endfunction

function! plugin#lightline#modified() abort
  if &filetype ==# 'help'
    return ''
  elseif &modified
    return '+'
  elseif &modifiable
    return ''
  else
    return ''
  endif
endfunction

function! plugin#lightline#filename() abort
  if &filetype ==# 'denite'
    return substitute(denite#get_status_mode(), ' *-- ', '', 'g')
  else
    if '' !=# expand('%:t')
      return expand('%:t') . ('' !=# plugin#lightline#modified() ? ' ' . plugin#lightline#modified() : '')
    else
      return '' !=# plugin#lightline#modified() ? ' ' . plugin#lightline#modified() : ''
    endif
  endif
endfunction

function! plugin#lightline#fileencoding() abort
  if &filetype ==# 'dirvish' || &filetype ==# 'denite'
    return ''
  else
    return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
  endif
endfunction

function! plugin#lightline#selector() abort
  return &filetype ==# 'denite' ? denite#get_status_sources() : ''
endfunction

function! plugin#lightline#vcs() abort
  if &filetype ==# 'denite'
    return ''
  else
    try
      if exists('*fugitive#head')
        if $DISPLAY ==# ''
          let l:mark = ''
        else
          let l:mark = "\ue0a0 "
        endif
        let l:branch = fugitive#head()
        return strlen(l:branch) ? l:mark.l:branch : ''
      endif
    catch
    endtry
  endif
endfunction

function! plugin#lightline#fileformat() abort
  if $DISPLAY ==# ''
    if &filetype ==# 'dirvish' || &filetype ==# 'denite'
      return ''
    else
      return winwidth(0) > 70 ? (strlen(&fileformat) ? &fileformat : '') : ''
    endif
  else
    if &filetype ==# 'dirvish' || &filetype ==# 'denite'
      return ''
    else
      return winwidth(0) > 70 ? &fileformat : ''
    endif
  endif
endfunction

function! plugin#lightline#filetype() abort
  if $DISPLAY ==# ''
    if &filetype ==# 'dirvish' || &filetype ==# 'denite'
      return ''
    else
      return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
    endif
  else
    if &filetype ==# 'dirvish' || &filetype ==# 'denite'
      return ''
    else
      if winwidth(0) > 70
        return strlen(&filetype) ? &filetype : ''
      else
        return ''
      endif
    endif
  endif
endfunction

function! plugin#lightline#mode() abort
  return  &filetype ==# 'dirvish' ? 'Dirvish' :
        \ &filetype ==# 'denite' ? 'Denite' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction
