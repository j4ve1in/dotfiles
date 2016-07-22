augroup fileTypeDetect
  autocmd!
  autocmd BufNewFile,BufRead *.go setfiletype go
  autocmd BufNewFile,BufRead *.md setfiletype markdown
  autocmd BufNewFile,BufRead *.slim setfiletype slim
  autocmd BufNewFile,BufRead *.coffee setfiletype coffee
  autocmd BufNewFile,BufRead *.jbuilder setfiletype ruby
  autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
augroup END
