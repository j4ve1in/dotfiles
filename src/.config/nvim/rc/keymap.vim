" init {{{
nnoremap <silent> <Autoload>(sudo-write)  :<C-u>call sudo#write()<CR>
nnoremap <silent> <Autoload>(symlink-follow) :<C-u>call symlink#follow()<CR>
nnoremap <silent> <Autoload>(append-line-up) :<C-u>call append#line('up')<CR>
nnoremap <silent> <Autoload>(append-line-down) :<C-u>call append#line('down')<CR>
nnoremap <silent> <Autoload>(syntax-info) :<C-u>call syntax#info()<CR>
nnoremap <silent> <Autoload>(source-init) :<C-u>call source#init()<CR>
" }}}

" base {{{
cnoremap ; <CR>
nnoremap s "_s
nnoremap <silent> <ESC> <C-l>:<C-u>nohlsearch<CR>
nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W
nnoremap <C-n> "zdd"zp
nnoremap <C-p> "zdd<Up>"zP
vnoremap <C-n> "zx"zp`[V`]
vnoremap <C-p> "zx<Up>"zP`[V`]
noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" }}}

" emacs like {{{
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
" }}}

" Substitute {{{
nnoremap gs :<C-u>%s///g<Left><Left><Left>
vnoremap gs :s///g<Left><Left><Left>
" }}}

" Search {{{
nnorema <silent> n nzzzv
nnorema <silent> N Nzzzv
nnorema <silent> * *zzzv
nnorema <silent> # #zzzv
nnorema <silent> g* g*zzzv
nnorema <silent> g# g#zzzv
" }}}

" C-Space {{{
if has('unix')
  map <NUL> <C-Space>
  map! <NUL> <C-Space>
endif
" }}}

" quickfix {{{
nnoremap <silent> <C-q> :<C-u>copen<CR>
nnoremap <silent> <C-q>j :<C-u>cnext<CR>
nnoremap <silent> <C-q>k :<C-u>cprevious<CR>
nnoremap <silent> <C-q>gg :<C-u>cfirst<CR>
nnoremap <silent> <C-q>G  :<C-u>clast<CR>
augroup quickfix_keymap
  autocmd!
  autocmd BufReadPost quickfix nnoremap <silent> <buffer> q :<C-u>q<CR>
augroup END
" }}}

" autoload {{{
nmap gw <Autoload>(sudo-write)
nmap go <Autoload>(append-line-up)
nmap gO <Autoload>(append-line-down)
nmap gsi <Autoload>(syntax-info)
nmap <C-e> <Autoload>(symlink-follow)
nmap <Space>.  <Autoload>(source-init)
" }}}
