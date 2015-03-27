if !1 | finish | endif "vim-tinyとvim-smallのときはエラーを防ぐため終了する
command! NeoBundleInit try | call s:neobundle_init()
      \| catch /^neobundleinit:/
        \|   echohl ErrorMsg
        \|   echomsg v:exception
        \|   echohl None
        \| endtry

function! s:neobundle_init()
  redraw | echo "Installing neobundle.vim..."
  if executable('git')
    call system('git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim')
    echomsg 'Installed neobundle.vim'
    if v:shell_error
      throw 'neobundleinit: Git error.'
    endif
  endif
endfunction

if isdirectory(expand('~/.vim/bundle/neobundle.vim'))
  set runtimepath+=~/.vim/bundle/neobundle.vim/ "bundleで管理するディレクトリを指定する

  let g:neobundle#log_filename = $HOME.'/.vim/tmp/neobundle.log'

  call neobundle#begin(expand('~/.vim/bundle/')) "NeoBundleで読み込むプラグインを次の行からの記述で指定する

  source ~/.vimrc.plugin.d/bundle_list.vimrc "NeoBundleで読み込むプラグインを指定する

  call neobundle#end() "NeoBundleで読み込むプラグインの指定を終了する

  filetype plugin indent on "ファイル名と内容によってファイルタイプを判断し、ファイルタイププラグインを有効にする

  NeoBundleCheck " 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする
endif
