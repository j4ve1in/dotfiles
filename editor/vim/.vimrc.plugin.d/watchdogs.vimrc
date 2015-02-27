" vintコマンドが存在するときだけチェックを行うようにします
let g:quickrun_config = {
\    'vim/watchdogs_checker': {
\     'type': executable('vint') ? 'watchdogs_checker/vint' : '',
\    },
\    "watchdogs_checker/vint" : {
\       "command"   : "vint",
\       "exec"      : "%c %o %s:p ",
\   },
\ }

" ここはautogroup経由で定義するようにしないとvintに怒られます
autocmd BufWritePost .vimrc,*.vim WatchdogsRunSilent
