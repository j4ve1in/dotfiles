# Javelin's Dotfiles

[![Waffle.io](https://img.shields.io/badge/task-Waffle.io-blue.svg?style=flat-square "Waffle.io")](https://waffle.io/tetsuya00/dotfiles)
[![Gitter](https://img.shields.io/badge/chat-Gitter-lightgrey.svg?style=flat-square "Gitter")](https://gitter.im/tetsuya00/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![Screenshot](/img/screenshot.png "Screenshot")

# Installation
## Using shell script
### via curl
```bash
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/tetsuya00/dotfiles/master/tools/install.bash)"
```

### via wget
```bash
$ bash -c "$(wget --no-check-certificate https://raw.githubusercontent.com/tetsuya00/dotfiles/master/tools/install.bash -q -O -)"
```

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
        -d, --deploy      Deploy local sample files
        -r, --reinstall   Reinstall dotfiles
        -U, --uninstall   Uninstall dotfiles
        -h, --help        View help
