# Compile
## ~/.zsh/.zshrc
file=".zsh/.zshrc"
if [ ~/.dotfiles/Shell/Zsh/${file} -nt ~/.dotfiles/Shell/Zsh/${file}.zwc ]; then
    zcompile ~/.dotfiles/Shell/Zsh/${file}
    ln -sf ~/.dotfiles/Shell/Zsh/${file}.zwc ~/${file}.zwc
fi

## ~/.zshrc.plugin.d/*.zshrc
for file in .zshrc.plugin.d/*.zshrc; do
    if [ ~/.dotfiles/Shell/Zsh/${file} -nt ~/.dotfiles/Shell/Zsh/${file}.zwc ]; then
        zcompile ~/.dotfiles/Shell/Zsh/${file}
        ln -sf ~/.dotfiles/Shell/Zsh/${file}.zwc ~/${file}.zwc
    fi
done

## ~/.zshrc.d/*.zshrc
for file in .zshrc.d/*.zshrc; do
    if [ ~/.dotfiles/Shell/Zsh/${file} -nt ~/.dotfiles/Shell/Zsh/${file}.zwc ]; then
        zcompile ~/.dotfiles/Shell/Zsh/${file}
        ln -sf ~/.dotfiles/Shell/Zsh/${file}.zwc ~/${file}.zwc
    fi
done

# Load
## Plugin
source ~/.zshrc.plugin.d/plugin_list.zshrc

## ~/.zshrc.d/*.zshrc
for file in ~/.zshrc.d/*.zshrc; do
    source ${file}
done

## alias
source ~/.aliases

## TMUX
source ~/.tmux.autoload
