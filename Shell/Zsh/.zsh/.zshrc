# Plugin
source ~/.zshrc.plugin.d/plugin_list.zshrc

# Load ~/.zshrc.d/*.zshrc
for file in ~/.zshrc.d/*.zshrc; do
    source ${file}
done

# alias
source ~/.aliases

# TMUX
source ~/.tmux.autoload
