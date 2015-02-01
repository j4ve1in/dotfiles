" Load Plugins
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

" Completion
function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

if s:meet_neocomplete_requirements()
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundleFetch 'Shougo/neocomplcache.vim'
else
    NeoBundleFetch 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neocomplcache.vim'
endif

" Others
NeoBundle 'Townk/vim-autoclose' "abbreviateで括弧に書き換える時支障が出る

NeoBundle 'mattn/emmet-vim'

NeoBundle 'thinca/vim-quickrun'

NeoBundle 'vim-scripts/vim-auto-save'

NeoBundle 'kannokanno/previm'

NeoBundleLazy "tyru/open-browser.vim", {
\ 'autoload' : {
\       'functions' : "OpenBrowser",
\       'commands'  : ["OpenBrowser", "OpenBrowserSearch"],
\       'mappings'  : "<Plug>(openbrowser-smart-search)"
\    },
\ }

NeoBundle 'nathanaelkane/vim-indent-guides'

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

NeoBundleLazy 'itchyny/lightline.vim'

NeoBundleLazy 'scrooloose/nerdcommenter'

NeoBundleLazy 'plasticboy/vim-markdown'

" Load Plugins Settings
source ~/.vimrc.plugin.d/netrw.vimrc

source ~/.vimrc.plugin.d/tweetvim.vimrc

source ~/.vimrc.plugin.d/autosave.vimrc

source ~/.vimrc.plugin.d/indent_guides.vimrc

if s:meet_neocomplete_requirements()
    source ~/.vimrc.plugin.d/neocomplete.vimrc
else
    source ~/.vimrc.plugin.d/neocomplcache.vimrc
endif
