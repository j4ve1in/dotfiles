if !1 | finish | endif "vim-tinyとvim-smallのときはエラーを防ぐため終了する

" NeoBundle
if isdirectory(expand('~/.vim/bundle/neobundle.vim'))
  set runtimepath+=~/.vim/bundle/neobundle.vim/ "bundleで管理するディレクトリを指定する

  let g:neobundle#log_filename = $HOME.'/.vim/var/tmp/plugin/neobundle.log'

  call neobundle#begin(expand('~/.vim/bundle/')) "NeoBundleで読み込むプラグインを次の行からの記述で指定する

  source ~/.vimrc.plugin.d/neobundle.list.rc.vim "NeoBundleで読み込むプラグインを指定する

  call neobundle#end() "NeoBundleで読み込むプラグインの指定を終了する

  filetype plugin indent on "ファイル名と内容によってファイルタイプを判断し、ファイルタイププラグインを有効にする

  NeoBundleCheck " 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする
endif

nnoremap [NeoBundle] <Nop>
nmap <Space>n [NeoBundle]

nnoremap <silent> [NeoBundle]l :<C-u>NeoBundleList<CR>
nnoremap <silent> [NeoBundle]L :<C-u>NeoBundleLog<CR>
nnoremap <silent> [NeoBundle]u :<C-u>NeoBundleUpdate<CR>

let g:unite_enable_start_insert = 1
let g:unite_enable_auto_select = 0
call unite#custom#profile('default', 'context', {
  \ 'prompt_direction': 'top',
  \ 'prompt': '> ',
  \ 'candidate_icon': '- ',
  \ 'hide_icon': 0 })
