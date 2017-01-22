# dotfiles - configuration files

[Overview](#overview) |
[Installation](#installation) |
[Trial](#trial) |
[License](#license)

[![license-badge]][license-link]
[![release-badge]][release-link]
![platform-badge]

## Overview

This repository manage configuration files on Unix-type operating systems.
For see all screenshot, check out the [wiki page][wiki-page-link].

![screenshot1]
![screenshot2]

## Installation

You can install dotfiles by the following installation command.

```zsh
% zsh <(curl -L d.ytet5uy4.com)
```

**NOTE:** If you want to use **automatic installation**,
specify the `-y` option. When you use automatic installation,
assume `yes` as answer to all prompts and run non-interactively.

**Demo:**
[![demo]][demo-link]

## Trial

Before running installation command to setup dotfiles, you can pull
an **[image][docker-image-link]** and try my dotfiles in a Docker container
as follows.

```zsh
% docker pull ytet5uy4/dotfiles
% docker run -it --rm ytet5uy4/dotfiles
```

## License

Copyright (c) 2015 ytet5uy4

Released under the MIT License, see **[LICENSE.md][license-link]**.

[screenshot1]: //raw.githubusercontent.com/wiki/ytet5uy4/dotfiles/img/tmux.png
[screenshot2]: //raw.githubusercontent.com/wiki/ytet5uy4/dotfiles/img/xmonad.png
[demo]: //raw.githubusercontent.com/wiki/ytet5uy4/dotfiles/img/demo.png
[release-badge]: //img.shields.io/github/release/ytet5uy4/dotfiles.svg?style=flat-square
[license-badge]: //img.shields.io/github/license/ytet5uy4/dotfiles.svg?style=flat-square
[platform-badge]: //img.shields.io/badge/platform-GNU%2FLinux%20|%20Darwin-lightgrey.svg?style=flat-square

[release-link]: //github.com/ytet5uy4/dotfiles/releases/latest
[license-link]: LICENSE.md
[demo-link]: //asciinema.org/a/asz75pk2aqxwy5ttp1zvyxnxx
[wiki-page-link]: //github.com/ytet5uy4/dotfiles/wiki
[docker-image-link]: //hub.docker.com/r/ytet5uy4/dotfiles
