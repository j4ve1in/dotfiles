# Compile
## ~/.zsh/.zshrc
file=".zsh/.zshrc"
if [ ! -f ~/.dotfiles/Shell/Zsh/${file}.zwc -o ~/.dotfiles/Shell/Zsh/${file} -nt ~/.dotfiles/Shell/Zsh/${file}.zwc ]; then
    zcompile ~/.dotfiles/Shell/Zsh/${file}
fi

## ~/.zshrc.d/*.zshrc
for file in .zshrc.d/*.zshrc; do
    if [ ! -f ~/.dotfiles/Shell/Zsh/${file}.zwc -o ~/.dotfiles/Shell/Zsh/${file} -nt ~/.dotfiles/Shell/Zsh/${file}.zwc ]; then
        zcompile ~/.dotfiles/Shell/Zsh/${file}
    fi
done

## ~/.zshrc.function.d/*.zshrc
for file in .zshrc.function.d/*.zshrc; do
    if [ ! -f ~/.dotfiles/Shell/Zsh/${file}.zwc -o ~/.dotfiles/Shell/Zsh/${file} -nt ~/.dotfiles/Shell/Zsh/${file}.zwc ]; then
        zcompile ~/.dotfiles/Shell/Zsh/${file}
    fi
done

## ~/.zshrc.plugin.d/*.zshrc
for file in .zshrc.plugin.d/*.zshrc; do
    if [ ! -f ~/.dotfiles/Shell/Zsh/${file}.zwc -o ~/.dotfiles/Shell/Zsh/${file} -nt ~/.dotfiles/Shell/Zsh/${file}.zwc ]; then
        zcompile ~/.dotfiles/Shell/Zsh/${file}
    fi
done

# Load
## Plugin
for file in ~/.zshrc.plugin.d/*.zshrc; do
    source ${file}
done

## Function
for file in ~/.zshrc.function.d/*.zshrc; do
    source ${file}
done

## ~/.zshrc.d/*.zshrc
for file in ~/.zshrc.d/*.zshrc; do
    source ${file}
done

## alias
source ~/.aliases

## TMUX
source ~/.tmux.autoload
