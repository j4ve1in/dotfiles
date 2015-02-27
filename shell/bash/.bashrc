# Plugin
source ~/.bash.plugin.d/enhancd/enhancd.sh

# Load ~/.bashrc.d/*.bashrc
filepath="$HOME/.bashrc.d/*.bashrc"
for file in ${filepath}; do
    source ${file}
done

# alias
source ~/.aliases

# TMUX
source ~/.tmux.autoload
