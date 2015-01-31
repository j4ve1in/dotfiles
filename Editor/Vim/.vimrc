" runtimepath
set runtimepath+=~/
" プラグイン
" NeoBundleで管理しているプラグインの追加や削除等は.vimrc.pluginsでする
" また、自分の設定を上書きさせないため、必ず最初に読み込ませる
runtime .vimrc.plugin.d/neobundle.vimrc
runtime! .vimrc.plugin.d/*.vimrc

" その他
runtime! .vimrc.d/*.vimrc
