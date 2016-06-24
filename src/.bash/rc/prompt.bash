set_prompt () {
  has() { type $1 >/dev/null 2>&1; }
  # Colors
  ## Reset
  Color_Off='\[\e[0m\]'       # Text Reset
  ## Regular Colors
  Blue='\[\e[0;34m\]'         # Blue
  White='\[\e[0;37m\]'        # White

  # PROMPT1
  PS1=''
  ## Separator
  PS1+="${Blue}[${Color_Off}"
  ## Username and Hostname
  PS1+="\u@\h"
  ## SSH
  [ -n "$SSH_CLIENT" ] && PS1+="${White}:ssh-session${Color_Off}"
  ## dir
  PS1+=" \W${White}"
  ## Git
  if has git; then
    if git symbolic-ref HEAD >/dev/null 2>&1; then
      BRANCH="`git symbolic-ref HEAD 2>/dev/null | sed 's/^refs\/heads\///'`"
      PS1+=`has powerline && printf " \ue0a0 " || printf " < "`
      PS1+=`echo "$BRANCH"`
    fi
  fi
  ## Separator
  PS1+="${Blue}][${Color_Off}"
  ## Date
  PS1+="\D{%m/%d} \t"
  ## Separator
  PS1+="${Blue}]"
  ## Newline
  PS1+="\n"

  # PROMPT2
  PS1+="${Color_Off}\$ "
}
PROMPT_COMMAND='set_prompt'
