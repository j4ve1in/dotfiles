nnoremap <C-h><C-h> :<C-u>help<Space>
nnoremap <silent> <C-h><C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
nnoremap <silent> <Space>w :<C-u>w<CR>
nnoremap <silent> <Space>q :<C-u>q<CR>
nnoremap <silent> <Space>qa :<C-u>qa<CR>
nnoremap <silent> <Space>Q :<C-u>q!<CR>
nnoremap <Space>/ *
noremap <Space>h ^
noremap <Space>l $
noremap <Space>m %
nnoremap <Space>e :<C-u>edit!<CR>
nnoremap <Space>j <C-f>
vnoremap <Space>j <C-f>
nnoremap <Space>k <C-b>
vnoremap <Space>k <C-b>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <C-b>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap Y y$
inoremap jj <Esc>
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
inoremap {<Enter> {}<Left><CR><ESC><S-o><Tab>
inoremap [<Enter> []<Left><CR><ESC><S-o><Tab>
inoremap (<Enter> ()<Left><CR><ESC><S-o><Tab>
nnoremap j gj
nnoremap k gk
vnoremap v $h
nnoremap <silent> <ESC><ESC>
\  :<C-u>highlight CursorLine cterm=none ctermbg=24 ctermfg=24<CR> \|
\  :<C-u>sleep 1ms<CR> \|
\  :<C-u>highlight clear CursorLine<CR>
\  :<C-u>highlight CursorLine cterm=none ctermbg=24 ctermfg=24<CR> \|
\  :<C-u>sleep 1ms<CR> \|
\  :<C-u>highlight clear CursorLine<CR>

" Substitute
nnoremap gs :<C-u>%s///g<Left><Left><Left>
vnoremap gs :s///g<Left><Left><Left>

" .vimrc
nnoremap <silent> <Space><Space>.  :<C-u>edit $MYVIMRC \| :lcd ~/.vimrc.d<CR>
nnoremap <silent> <Space><Space>..  :<C-u>source $MYVIMRC<CR>

" Search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" TextObject
onoremap aa a>
onoremap ia i>
onoremap ar a]
onoremap ir i]
onoremap ad a"
onoremap id i"

" Buffer
nnoremap [Buffer] <Nop>
nmap <Leader>b [Buffer]
nnoremap <silent> [Buffer] :buffers<CR>
nnoremap [Buffer]e :buffer<Space>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <silent> [Buffer]d :bdelete<CR>
nnoremap <silent> [Buffer]t :tab ball<CR>

" Tab
nnoremap [Tab] <Nop>
nmap <Leader>t [Tab]
nnoremap <silent> [Tab] :tabs<CR>
nnoremap [Tab]e :tabedit<Space>
nnoremap L :tabnext<CR>
nnoremap H :tabprevious<CR>
nnoremap <silent> [Tab]n :tabnew<CR>
nnoremap <silent> [Tab]c :tabclose<CR>
nnoremap <silent> [Tab]o :tabonly<CR>
