set_prompt () {
  # Colors
  ## Reset
  Color_Off='\[\033[0m\]'       # Text Reset
  ## Regular Colors
  Blue='\[\033[0;34m\]'         # Blue
  White='\[\033[0;37m\]'        # White

  # PROMPT1
  ## SSH
  if [ -n "$SSH_CLIENT" ]; then
    ssh=":ssh-session"
  fi
  ## Git
  init-prompt-git-branch() {
  git symbolic-ref HEAD >/dev/null 2>&1 && echo " < $(git symbolic-ref HEAD 2>/dev/null | sed 's/^refs\/heads\///')"
}

if type git >/dev/null 2>&1; then
  export PS1_GIT_BRANCH="\$(init-prompt-git-branch)"
else
  export PS1_GIT_BRANCH=
fi
PS1="${Blue}[${Color_Off}\u@\h${White}${ssh} ${Color_Off}\W${White}${PS1_GIT_BRANCH}${Blue}]"
## Date
PS1+="[${Color_Off}\D{%m/%d} \t${Blue}]"
## Newline
PS1+="\n"

# PROMPT2
PS1+="${Color_Off}\$ "
}
PROMPT_COMMAND='set_prompt'
