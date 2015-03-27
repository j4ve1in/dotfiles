if [ -d ~/.zsh/function/zsh-completions ]; then
    fpath=($HOME/.zsh/function/zsh-completions/src(N-/) $fpath)
fi
