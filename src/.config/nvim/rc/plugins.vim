" minpac
if exists('*minpac#init')
  call minpac#init()

  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('vim-scripts/surround.vim')
  call minpac#add('soramugi/auto-ctags.vim')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('cohama/lexima.vim')
  call minpac#add('kana/vim-textobj-user')
  call minpac#add('vimtaku/vim-textobj-sigil')
  call minpac#add('fvictorio/vim-textobj-backticks')
  call minpac#add('w0rp/ale')
  call minpac#add('tyru/open-browser.vim')
  call minpac#add('Shougo/neosnippet')
  call minpac#add('tyru/caw.vim')
  call minpac#add('b4b4r07/vim-hcl')
  call minpac#add('dag/vim-fish')

  call minpac#add('shime/vim-livedown', {'type': 'opt'})
  call minpac#add('Shougo/deoplete.nvim', {'type': 'opt'})
  call minpac#add('zchee/deoplete-go', {'type': 'opt'}, {'do': {-> system('make')}})
  call minpac#add('fatih/vim-hclfmt', {'type': 'opt'})
  call minpac#add('elzr/vim-json', {'type': 'opt'})
  call minpac#add('cespare/vim-toml', {'type': 'opt'})
  call minpac#add('digitaltoad/vim-pug', {'type': 'opt'})
  call minpac#add('hashivim/vim-terraform', {'type': 'opt'})
  call minpac#add('baskerville/vim-sxhkdrc', {'type': 'opt'})
  call minpac#add('posva/vim-vue', {'type': 'opt'})
endif
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

" auto-ctags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']

" lightline
let g:lightline = {
      \   'colorscheme': 'abyss',
      \   'active': {
      \     'right': [['lineinfo'], ['filetype'], ['fileformat', 'fileencoding', 'syntaxcheck']],
      \   },
      \   'tabline': {
      \     'right': [[]],
      \   },
      \   'component': {
      \     'lineinfo': '%-2v',
      \     'filetype': '%{&ft!=#""?&ft:"-"}',
      \     'paste': '%{&paste?"P":""}',
      \   },
      \   'component_expand': {
      \     'syntaxcheck': 'plugin#lightline#syntaxcheck',
      \   },
      \   'component_type': {
      \     'syntaxcheck': 'error',
      \   },
      \   'component_function': {
      \     'filename': 'plugin#lightline#filename',
      \   },
      \   'mode_map': {
      \     'n' : 'N',
      \     'i' : 'I',
      \     'R' : 'R',
      \     'v' : 'V',
      \     'V' : 'V-L',
      \     "\<C-v>": 'V-B',
      \     'c' : 'C',
      \     's' : 'S',
      \     'S' : 'S-L',
      \     "\<C-s>": 'S-B',
      \     't': 'T',
      \   },
      \   'separator': {
      \     'left': "\ue0b0",
      \     'right': "\ue0b2",
      \   },
      \   'subseparator': {
      \     'left': "\ue0b1",
      \     'right': "\ue0b3",
      \   },
      \ }

" fzf
let g:fzf_command_prefix = 'FZF'
nnoremap <silent> <Space>f :<C-u>FZFFiles<CR>
nnoremap <silent> <Space>w :<C-u>FZFWindows<CR>
command! -bang -nargs=* FZFRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <silent> <Space>g :<C-u>FZFRg<CR>
autocmd! User FzfStatusLine silent

" openbrowser
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

let g:neosnippet#disable_runtime_snippets = {'_' : 1}
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'

" caw
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

" ale
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['go'] = ['goimports']
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_set_highlights = 0
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <silent> <Space><C-k> <Plug>(ale_previous_wrap)
nmap <silent> <Space><C-j> <Plug>(ale_next_wrap)

augroup ale_settings
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END

" livedown
augroup livedown
  autocmd!
  autocmd FileType markdown call plugin#livedown#init()
augroup END

" deoplete
augroup deoplete
  autocmd!
  autocmd InsertEnter * call plugin#deoplete#init()
augroup END

let g:deoplete#sources#go#package_dot = 1
augroup deoplete-go
  autocmd!
  autocmd FileType go packadd deoplete-go
augroup END

" hcl
let g:hcl_fmt_autosave = 0
let g:tf_fmt_autosave = 0
let g:nomad_fmt_autosave = 0

augroup hclfmt
  autocmd!
  autocmd FileType hcl packadd hclfmt
  autocmd FileType hcl nnoremap = :<C-u>HclFmt<CR>
augroup END

" json
augroup vim-json
  autocmd!
  autocmd FileType json packadd vim-json
  autocmd FileType json let g:vim_json_syntax_conceal = 0
augroup END

" toml
augroup vim-toml
  autocmd!
  autocmd FileType toml packadd vim-toml
augroup END

" pug
augroup vim-pug
  autocmd!
  autocmd FileType pug packadd vim-pug
  autocmd FileType vue packadd vim-pug
augroup END

" terraform
let g:terraform_fmt_on_save = 1
augroup vim-terraform
  autocmd!
  autocmd FileType terraform packadd vim-terraform
  autocmd FileType terraform nnoremap = :<C-u>TerraformFmt<CR>
augroup END

" sxhkd
augroup vim-sxhkdrc
  autocmd!
  autocmd FileType sxhkdrc packadd vim-sxhkdrc
augroup END

" vue
augroup vim-vue
  autocmd!
  autocmd FileType vue packadd vim-vue
augroup END
