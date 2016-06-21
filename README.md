<p align='center'>
<img width=20% src='https://media.githubusercontent.com/media/ytet5uy4/img/master/dotfiles/dotfiles.png'>
</p>

<p align='center'>
<b><a href='#overview'>Overview</a></b>
|
<b><a href='#installation'>Installation</a></b>
|
<b><a href='#configurations'>Configurations</a></b>
|
<b><a href='#test-with-docker'>Test with Docker</a></b>
|
<b><a href='//github.com/ytet5uy4/dotfiles/blob/master/README.ja.md'>Japanese README</a></b>
|
<b><a href='#license'>License</a></b>
</p>

<p align='center'>
<a href='//github.com/ytet5uy4/dotfiles/blob/master/LICENSE.md'><img src='https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square'></a>
<img src='https://img.shields.io/badge/platform-GNU%2FLinux%20|%20Darwin%20|%20MSYS2-lightgrey.svg?style=flat-square'>
</p>


# Overview
This repository manage configuration files on Unix-type operating systems.

![Screenshot]

# Installation
You can install dotfiles by the following installation command.

|      | Installation command                   |
|:----:|:---------------------------------------|
| cURL | bash <(curl -L d.ytet5uy4.com)         |
| Wget | bash <(wget -O - d.ytet5uy4.com)       |

**NOTE:** If you want to use **full installation**, specify the `-f` option.
When you use full installation, install shell, editor and multiplexer plugin, too.

**NOTE2:** If you want to use **automatic installation**,
specify the `-y` option. When you use automatic installation,
assume `yes` as answer to all prompts and run non-interactively.

**Demo:**
<a href="//asciinema.org/a/48340" target="_blank"><img src="https://media.githubusercontent.com/media/ytet5uy4/img/master/dotfiles/demo.png"></a>

# Configurations
## Dotsetup

    NAME
        dotsetup - DOTfiles SETUP

    SYNOPSIS
        dotsetup [options]

    DESCRIPTION
        Dotsetup is dotfile's setup command.

    OPTIONS
        -u, --update             Backup and download dotfiles
        -d, --deploy             Deploy dotfiles to home directory
        -b, --backup             Backup dotfiles to backup branch
        -r, --reinstall          Install dotfiles again after uninstalling
        -U, --uninstall          Uninstall dotfile
        -l, --list               View dotfile's list
        -h, --help               View help
        -p, --install-plugin     Install vim, zsh and tmux plugin
        -P, --uninstall-plugin   Uninstall vim, zsh and tmux plugin

![dotsetup1]
![dotsetup2]

# Test with Docker
Before running installation command to setup dotfiles, you can pull
an **[image]** and try my dotfiles in a Docker container as follows.
```bash
$ docker pull ytet5uy4/dotfiles
$ docker run -it --rm ytet5uy4/dotfiles
```

# License
Copyright (c) 2015 ytet5uy4  
Released under the MIT License, see **[LICENSE.md]**.

[Screenshot]: https://media.githubusercontent.com/media/ytet5uy4/img/master/dotfiles/screenshot.png
[dotsetup1]: https://media.githubusercontent.com/media/ytet5uy4/img/master/dotfiles/dotsetup1.png
[dotsetup2]: https://media.githubusercontent.com/media/ytet5uy4/img/master/dotfiles/dotsetup2.png
[image]: //hub.docker.com/r/ytet5uy4/dotfiles
[LICENSE.md]: //github.com/ytet5uy4/dotfiles/blob/master/LICENSE.md
