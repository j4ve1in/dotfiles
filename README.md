# Javelin's Dotfiles

[![Waffle.io](https://img.shields.io/badge/task-Waffle.io-blue.svg?style=flat-square "Waffle.io")](https://waffle.io/j4ve1in/dotfiles)
[![Gitter](https://img.shields.io/badge/chat-Gitter-lightgrey.svg?style=flat-square "Gitter")](https://gitter.im/j4ve1in/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![Screenshot](/img/screenshot.png "Screenshot")

# Installation
You can install by the following commands.
## via curl
```bash
$ exec bash -c "$(curl -L https://raw.githubusercontent.com/j4ve1in/dotfiles/master/tools/install.bash)"
```

## via wget
```bash
$ exec bash -c "$(wget -O - https://raw.githubusercontent.com/j4ve1in/dotfiles/master/tools/install.bash)"
```

**NOTE:** If you want to use automatic installation, type `export ASSUME_YES="1"` in your terminal. When you use automatic installation, assume "yes" as answer to all prompts and run non-interactively.

# Configurations
## Dotsetup
![dotsetup](/img/dotsetup.png "dotsetup")

    NAME
        dotsetup - DOTfiles SETUP

    SYNOPSIS
        dotsetup [options]

    DESCRIPTION
        Dotsetup is dotfile's setup command.

    OPTIONS
        -u, --update      Update dotfiles
        -b, --backup      Backup dotfiles
        -r, --reinstall   Reinstall dotfiles
        -U, --uninstall   Uninstall dotfiles
        -h, --help        View help
