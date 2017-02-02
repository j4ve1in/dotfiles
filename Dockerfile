FROM archlinuxjp/archlinux
MAINTAINER ytet5uy4

# Install packages and create user
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm git zsh tmux \
    neovim python-pip python2-pip python-neovim python2-neovim && \
    pacman -Scc --noconfirm && \
    useradd -m -s /bin/zsh docker

USER docker
WORKDIR /home/docker
ENV TERM=xterm-256color LANG=en_US.UTF-8
SHELL ["/bin/zsh", "-c"]

# Login
ENTRYPOINT zsh <(curl -L d.ytet5uy4.com) -y && zsh -l
