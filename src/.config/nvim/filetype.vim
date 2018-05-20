augroup fileTypeDetect
  autocmd!
  autocmd BufNewFile,BufRead *.hcl setfiletype hcl
  autocmd BufNewFile,BufRead *.tf setfiletype terraform
  autocmd BufNewFile,BufRead *.fish setfiletype fish
  autocmd BufNewFile,BufRead *.vue setfiletype vue
  autocmd BufNewFile,BufRead sxhkdrc,*.sxhkd setfiletype sxhkdrc
  autocmd BufNewFile,BufRead dunstrc setfiletype cfg
  autocmd BufNewFile,BufRead xmobarrc setfiletype haskell
  autocmd BufNewFile,BufRead rifle.conf setfiletype cfg
augroup END
