" Load Plugins
NeoBundleFetch 'Shougo/neobundle.vim'

" Filer
NeoBundleLazy 'Shougo/vimfiler', {
\   'depends' : ['Shougo/unite.vim'],
\   'autoload' : {
\       'commands' : [ 'VimFilerTab', 'VimFiler', 'VimFilerExplorer' ]
\   }
\ }

NeoBundle 'scrooloose/nerdtree'

" Unite
NeoBundleLazy 'Shougo/unite.vim', {
\   'autoload' : {
\       'commands' : [ 'Unite' ]
\   }
\ }

NeoBundle 'pasela/unite-webcolorname'

NeoBundle 'Shougo/unite-outline'

" Git
NeoBundle 'cohama/agit.vim'

NeoBundle 'kmnk/vim-unite-giti'

" Twitter
NeoBundle 'basyura/TweetVim'

NeoBundle 'basyura/twibill.vim'

" Syntax

NeoBundle "osyo-manga/vim-watchdogs"

NeoBundle 'cohama/vim-hier'

NeoBundle 'dannyob/quickfixstatus'

NeoBundle "osyo-manga/shabadou.vim"

NeoBundleLazy 'othree/html5.vim', {
\   'autoload' : { 'filetypes' : ['html'] },
\ }

NeoBundleLazy 'hail2u/vim-css3-syntax', {
\   'autoload' : { 'filetypes' : ['css'] },
\ }

" Completion
NeoBundleLazy 'mattn/emmet-vim', {
\   'autoload' : { 'filetypes' : ['html'] },
\ }

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

NeoBundle 'thinca/vim-quickrun'

NeoBundle 'vim-scripts/vim-auto-save'

NeoBundle 'kannokanno/previm'

NeoBundle 'tyru/open-browser.vim'

NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'surround.vim'

NeoBundle 'mattn/webapi-vim'

NeoBundle 'basyura/bitly.vim'

NeoBundle 'mattn/favstar-vim'

NeoBundleLazy 'Shougo/vimshell.vim', {
\ 'autoload': {
\   'commands': ['VimShell']
\ }
\}

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'supermomonga/thingspast.vim'

NeoBundle 'cocopon/colorswatch.vim'

NeoBundle 'editorconfig/editorconfig-vim'

NeoBundleFetch 'itchyny/lightline.vim'

NeoBundleFetch 'scrooloose/nerdcommenter'

NeoBundleFetch 'plasticboy/vim-markdown'

" Load Plugins Settings
if ! empty(neobundle#get('nerdtree'))
  source ~/.vimrc.plugin.d/netrw.vimrc
endif

if ! empty(neobundle#get('TweetVim'))
  source ~/.vimrc.plugin.d/tweetvim.vimrc
endif

if ! empty(neobundle#get('vim-auto-save'))
  source ~/.vimrc.plugin.d/autosave.vimrc
endif

if ! empty(neobundle#get('vim-indent-guides'))
  source ~/.vimrc.plugin.d/indent_guides.vimrc
endif

if s:meet_neocomplete_requirements()
  if ! empty(neobundle#get('neocomplete.vim'))
    source ~/.vimrc.plugin.d/neocomplete.vimrc
  endif
else
  if ! empty(neobundle#get('neocomplcache.vim'))
    source ~/.vimrc.plugin.d/neocomplcache.vimrc
  endif
endif
