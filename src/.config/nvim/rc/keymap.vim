nnoremap Y y$
nnoremap s "_s
nnoremap gs :<C-u>%s///g<Left><Left><Left>
nnoremap <silent> <ESC> <C-l>:<C-u>nohlsearch<CR>
nnoremap <C-h> gT
nnoremap <C-l> gt
noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" emacs like
inoremap <C-j> <CR><TAB>
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h
inoremap <C-d> <DEL>
cnoremap <C-a> <C-b>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <DEL>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" Search
nnorema <silent> n nzzzv
nnorema <silent> N Nzzzv
nnorema <silent> * *zzzv
nnorema <silent> # #zzzv
nnorema <silent> g* g*zzzv
nnorema <silent> g# g#zzzv
