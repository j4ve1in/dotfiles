" プラグイン
" NeoBundleで管理しているプラグインの追加や削除等は.vimrc.pluginsでする
" また、自分の設定を上書きさせないため、必ず最初に読み込ませる
source ~/.vimrc.plugin.neobundle

" その他
set runtimepath+=~/
runtime! .vimrc.d/.vimrc.*
