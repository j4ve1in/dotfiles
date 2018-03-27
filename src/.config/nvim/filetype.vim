augroup fileTypeDetect
  autocmd!
  autocmd BufNewFile,BufRead dunstrc setfiletype cfg
  autocmd BufNewFile,BufRead xmobarrc setfiletype haskell
  autocmd BufNewFile,BufRead rifle.conf setfiletype cfg
augroup END
