function! plugin#lightline#syntaxcheck()
  if !exists('*neomake#statusline#LoclistCounts')
    return ''
  endif

  let total = 0

  for v in values(neomake#statusline#LoclistCounts())
    let total += v
  endfor

  for v in items(neomake#statusline#QflistCounts())
    let total += v
  endfor

  if total == 0
    return ''
  endif

  return 'line '.getloclist(0)[0].lnum. ', 1 of '.total
endfunction

function! plugin#lightline#percent()
  if &ft == 'dirvish' || &ft == 'denite'
    return ''
  else
    let line = line('.')
    let max_line = line('$')
    return printf('%3d%s', (line * 100 / max_line), '%')
  endif
endfunction

function! plugin#lightline#lineinfo()
  if &ft == 'dirvish'
    return ''
  elseif &ft == 'denite'
    return denite#get_status_linenr()
  else
    let line = line('.')
    let max_line = line('$')
    let col = col('.')
    return printf('%3d[%d]:%-2d', line, max_line, col)
  endif
endfunction

function! plugin#lightline#modified()
  if &filetype == "help"
    return ''
  elseif &modified
    return '+'
  elseif &modifiable
    return ''
  else
    return ''
  endif
endfunction

function! plugin#lightline#filename()
  if &ft == 'denite'
    return substitute(denite#get_status_mode(), ' *-- ', '', 'g')
  else
    if '' != expand('%:t')
      return expand('%:t') . ('' != plugin#lightline#modified() ? ' ' . plugin#lightline#modified() : '')
    else
      return '' != plugin#lightline#modified() ? ' ' . plugin#lightline#modified() : ''
    endif
  endif
endfunction

function! plugin#lightline#fileencoding()
  if &ft == 'dirvish' || &ft == 'denite'
    return ''
  else
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
  endif
endfunction

function! plugin#lightline#selector()
  return &ft == 'denite' ? denite#get_status_sources() : ''
endfunction

function! plugin#lightline#vcs()
  if ! &ft == 'denite'
    try
      if exists('*fugitive#head')
        if $DISPLAY == ''
          let mark = ''
        else
          let mark = "\ue0a0 "
        endif
        let _ = fugitive#head()
        return strlen(_) ? mark._ : ''
      endif
    catch
    endtry
  endif
  return ''
endfunction

function! plugin#lightline#fileformat()
  if $DISPLAY == ''
    if &ft == 'dirvish' || &ft == 'denite'
      return ''
    else
      return winwidth(0) > 70 ? (strlen(&fileformat) ? &fileformat : '') : ''
    endif
  else
    if &ft == 'dirvish' || &ft == 'denite'
      return ''
    else
      return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
    endif
  endif
endfunction

function! plugin#lightline#filetype()
  if $DISPLAY == ''
    if &ft == 'dirvish' || &ft == 'denite'
      return ''
    else
      return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
    endif
  else
    if &ft == 'dirvish' || &ft == 'denite'
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

function! plugin#lightline#mode()
  return  &ft == 'dirvish' ? 'Dirvish' :
        \ &ft == 'denite' ? 'Denite' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction
