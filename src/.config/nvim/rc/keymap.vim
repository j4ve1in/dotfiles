cnoremap <C-a> <Nop>
cnoremap <C-b> <Nop>
cnoremap <C-e> <Nop>
nnoremap s "_s
nnoremap gs :<C-u>%s///g<Left><Left><Left>
nnoremap <silent> <ESC> <C-l>:<C-u>nohlsearch<CR>
noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')

" Yank and Paste
nnoremap Y y$
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Search
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> * *zzzv
nnoremap <silent> # #zzzv
nnoremap <silent> g* g*zzzv
nnoremap <silent> g# g#zzzv
