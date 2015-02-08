source ~/.env

# Prompt
## Colors
autoload colors
colors
Blue='%{$fg_no_bold[blue]%}'          # Blue
White='%{$fg_no_bold[white]%}'        # White
## SSH
if [ -n "$SSH_CLIENT" ]; then
    ssh=":ssh-session"
fi

## Git
init-prompt-git-branch() {
    git symbolic-ref HEAD 2>/dev/null >/dev/null && echo "< $(git symbolic-ref HEAD 2>/dev/null | sed 's/^refs\/heads\///')"
}

if which git 2>/dev/null >/dev/null ; then
    export PS1_GIT_BRANCH='$(init-prompt-git-branch)'
else
    export PS1_GIT_BRANCH=
fi

PROMPT="${Blue}[%f%n@%m${White}${ssh}%f %1~ ${White}${PS1_GIT_BRANCH}%f${Blue}][%f%D{%Y/%m/%d} %T${Blue}]%f
${VIMODE}%B%(!.#.%%)%b "
#RPROMPT="%T" # 右側に時間表示
#setopt transient_rprompt # 右側まで入力がきたら時間表示を消す
setopt prompt_subst # 変数展開など便利なプロント

zmodload zsh/datetime # $EPOCHSECONDS, strftime等を利用可能に
reset_tmout() { TMOUT=$[60-EPOCHSECONDS%60] }
precmd_functions=($precmd_functions reset_tmout) # プロンプト表示時に更新までの時間を再計算
redraw_tmout() { zle reset-prompt; reset_tmout } # 時刻を更新
TRAPALRM() { redraw_tmout }
