# Compile
echo -e "\033[4;39mCheck zsh's configuration files\033[0;39m"
## ~/.zsh/.zshrc
file=".zsh/.zshrc"
if [ ! -f ~/${file}.zwc ] || [ ~/${file} -nt ~/${file}.zwc ]; then
  echo " Compile ${file}..."
  zcompile ~/${file}
  echo -e "\033[1;36mdone\033[0;39m"
fi

## ~/.zshrc.d/*.rc.zsh
for file in .zshrc.d/*.rc.zsh; do
  if [ ! -f ~/${file}.zwc ] || [ ~/${file} -nt ~/${file}.zwc ]; then
    echo " Compile ${file}..."
    zcompile ~/${file}
    echo -e "\033[1;36mdone\033[0;39m"
  fi
done

## ~/.zshrc.function.d/*.rc.zsh
for file in .zshrc.function.d/*.rc.zsh; do
  if [ ! -f ~/${file}.zwc ] || [ ~/${file} -nt ~/${file}.zwc ]; then
    echo " Compile ${file}..."
    zcompile ~/${file}
    echo -e "\033[1;36mdone\033[0;39m"
  fi
done

## ~/.zshrc.plugin.d/*.rc.zsh
for file in .zshrc.plugin.d/*.rc.zsh; do
  if [ ! -f ~/${file}.zwc ] || [ ~/${file} -nt ~/${file}.zwc ]; then
    echo " Compile ${file}..."
    zcompile ~/${file}
    echo -e "\033[1;36mdone\033[0;39m"
  fi
done
echo
clear
