if !1 | finish | endif "vim-tinyとvim-smallのときはエラーを防ぐため終了する

set runtimepath+=~/.vim/bundle/neobundle.vim/ "bundleで管理するディレクトリを指定する

call neobundle#begin(expand('~/.vim/bundle/')) "NeoBundleで読み込むプラグインを次の行からの記述で指定する

source ~/.vimrc.plugin.d/bundle_list.vimrc "NeoBundleで読み込むプラグインを指定する

call neobundle#end() "NeoBundleで読み込むプラグインの指定を終了する

filetype plugin indent on "ファイル名と内容によってファイルタイプを判断し、ファイルタイププラグインを有効にする

NeoBundleCheck " 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする
