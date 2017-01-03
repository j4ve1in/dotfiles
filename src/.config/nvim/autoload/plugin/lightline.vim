function! plugin#lightline#syntaxcheck() abort
  if !exists('*neomake#statusline#LoclistCounts')
    return ''
  endif

  let l:total = 0

  for l:v in values(neomake#statusline#LoclistCounts())
    let l:total += l:v
  endfor

  for l:v in items(neomake#statusline#QflistCounts())
    let l:total += l:v
  endfor

  if l:total == 0
    return ''
  endif

  return 'line '.getloclist(0)[0].lnum. ', 1 of '.l:total
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
      return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
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
        return strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : ''
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
