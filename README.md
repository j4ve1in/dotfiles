[![Stories in Ready](https://badge.waffle.io/tetsuya00/Dotfiles.png?label=ready&title=Ready)](https://waffle.io/tetsuya00/Dotfiles)
# Javelin's Dotfiles
![Screenshot](/Images/Screenshot.png)

# Installation
## Using shell script
### via curl
```bash
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/tetsuya00/Dotfiles/master/Tools/install.bash)"
```

### via wget
```bash
$ bash -c "$(wget --no-check-certificate https://raw.githubusercontent.com/tetsuya00/Dotfiles/master/Tools/install.bash -q -O -)"
```

# Configurations
## Dotsetup
![dotsetup](/Images/dotsetup.png)

    NAME
        dotsetup - DOTfiles SETUP

    SYNOPSIS
        dotsetup [options]

    DESCRIPTION
        Dotsetup is dotfile's setup command.

    OPTIONS
        -u, --update      Update dotfiles
        -b, --backup      Backup dotfiles
        -d, --deploy      Deploy local sample files
        -r, --reinstall   Reinstall dotfiles
        -U, --uninstall   Uninstall dotfiles
        -h, --help        View help
