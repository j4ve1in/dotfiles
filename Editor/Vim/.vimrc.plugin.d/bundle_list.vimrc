NeoBundleFetch 'Shougo/neobundle.vim'

" Filer

NeoBundle 'Shougo/vimfiler'

NeoBundle 'scrooloose/nerdtree'

" Unite
NeoBundle 'Shougo/unite.vim'

NeoBundle 'pasela/unite-webcolorname'

NeoBundle 'h1mesuke/unite-outline'

" Git
NeoBundle 'cohama/agit.vim'

NeoBundle 'kmnk/vim-unite-giti'

" Twitter
NeoBundle 'basyura/TweetVim'

NeoBundle 'basyura/twibill.vim'

" Syntax
NeoBundle 'othree/html5.vim'

NeoBundle 'hail2u/vim-css3-syntax'

"Others
NeoBundle 'Townk/vim-autoclose' "abbreviateで括弧に書き換える時支障が出る

NeoBundle 'mattn/emmet-vim'

NeoBundle 'thinca/vim-quickrun'

NeoBundle 'vim-scripts/vim-auto-save'

NeoBundle 'kannokanno/previm'

NeoBundle 'tyru/open-browser.vim'

NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle has('lua') ? 'Shougo/neocomplete.vim' : 'Shougo/neocomplcache.vim'

NeoBundle 'surround.vim'

NeoBundle 'mattn/webapi-vim'

NeoBundle 'basyura/bitly.vim'

NeoBundle 'mattn/favstar-vim'

NeoBundle 'Shougo/vimshell.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

" NeoBundle 'itchyny/lightline.vim'

" NeoBundle 'scrooloose/nerdcommenter'

" NeoBundle 'plasticboy/vim-markdown'
