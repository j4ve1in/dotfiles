autoload -Uz compinit
compinit -u
setopt autopushd # auto directory pushd that you can get dirs list by cd -[tab]
setopt pushd_ignore_dups
setopt list_packed # compacked complete list display
setopt list_types
setopt correct # command correct edition before each completion attempt

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{cyan}Completing %B%d%b%f'

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

if [ "$OSTYPE" != "cygwin" ]; then
  # auto_cd
  setopt auto_cd

  function chpwd() {
    ls_abbrev
  }

  ls_abbrev() {
    if [[ ! -r $PWD ]]; then
      return
    fi
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-aCF' '--color=always')
    case "${OSTYPE}" in
      freebsd*|darwin*)
        if type gls > /dev/null 2>&1; then
          cmd_ls='gls'
        else
          # -G : Enable colorized output.
          opt_ls=('-aCFG')
        fi
        ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
      echo "$ls_result" | head -n 5
      echo '...'
      echo "$ls_result" | tail -n 5
      echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
      echo "$ls_result"
    fi
  }
fi
