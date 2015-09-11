nnoremap <C-h><C-h>      :<C-u>help<Space>
nnoremap <silent> <C-h><C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
nnoremap <silent> <Space>w  :<C-u>w<CR>
nnoremap <silent> <Space>q  :<C-u>q<CR>
nnoremap <Space>/ *
noremap <Space>h ^
noremap <Space>l $
noremap <Space>m %
nnoremap <Space>j  <C-f>
vnoremap <Space>j  <C-f>
nnoremap <Space>k  <C-b>
vnoremap <Space>k  <C-b>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap Y y$

" .vimrc
nnoremap <silent> <Space><Space>.  :<C-u>edit $MYVIMRC \| :lcd ~/.vimrc.d<CR>
nnoremap <silent> <Space><Space>..  :<C-u>source $MYVIMRC<CR>

" Buffer
nnoremap [Buffer] <Nop>
nmap <Leader>b [Buffer]
nnoremap <silent> [Buffer] :buffers<CR>
nnoremap [Buffer]e :buffer<Space>
nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>
nnoremap <silent> [Buffer]d :bdelete<CR>
nnoremap <silent> [Buffer]t :tab ball<CR>

" Tab
nnoremap [Tab] <Nop>
nmap <Leader>t [Tab]
nnoremap <silent> [Tab] :tabs<CR>
nnoremap [Tab]e :tabedit<Space>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <silent> [Tab]n :tabnew<CR>
nnoremap <silent> [Tab]c :tabclose<CR>
nnoremap <silent> [Tab]o :tabonly<CR>
