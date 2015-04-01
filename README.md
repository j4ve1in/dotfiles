# Javelin's Dotfiles

[![Waffle.io](https://img.shields.io/badge/task-Waffle.io-blue.svg?style=flat-square "Waffle.io")](https://waffle.io/j4ve1in/dotfiles)
[![Gitter](https://img.shields.io/badge/chat-Gitter-lightgrey.svg?style=flat-square "Gitter")](https://gitter.im/j4ve1in/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![Screenshot](/img/screenshot.png "Screenshot")

# Installation
You can install Javelin's dotfiles by the following installation command.
## Installation command
### via curl
```bash
$ bash -c "$(curl -L dot.j4ve1in.com)"
```

### via wget
```bash
$ bash -c "$(wget -O - dot.j4ve1in.com)"
```

**NOTE:** If you want to use **full installation**, type `export FULL_INSTALLATION="1"` and installation command in your terminal. When you use full installation, install shell and editor plugin, too.

**NOTE2:** If you want to use **automatic installation**, type `export ASSUME_YES="1"` and installation command in your terminal. When you use automatic installation, assume "yes" as answer to all prompts and run non-interactively.

**Demo:**
![Demo](/img/demo.gif "Demo")

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
        -u, --update       Update dotfiles
        -b, --backup       Backup dotfiles
        -r, --reinstall    Reinstall dotfiles
        -U, --uninstall    Uninstall dotfiles
        -h, --help         View help
        --install-plugin   Install shell and editor plugin
