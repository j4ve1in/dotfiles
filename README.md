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
        dsetup [options]

    DESCRIPTION
        Dotsetup is dotfile's setup command.

    OPTIONS
        --update      Update dotfiles
        -b            Backup dotfiles
        -d            Deploy local sample files
        -r            Reinstall dotfiles
        --uninstall   Uninstall dotfiles
        -h, --help    View help
