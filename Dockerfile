FROM alpine:3.4
MAINTAINER ytet5uy4

ENV NVIM_VERSION 0.1.6
ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF

# Update and Install packages
RUN apk update && apk upgrade && \
    apk add --no-cache curl git zsh tmux ncurses ncurses-dev ncurses-libs ncurses-terminfo g++ automake libtool m4 autoconf make cmake coreutils linux-headers unzip \
    python python-dev py-pip && pip install neovim
RUN curl -L https://github.com/neovim/libtermkey/archive/master.tar.gz | tar xz && \
    cd libtermkey-master && \
    make && \
    make install && \
    cd .. && rm -rf libtermkey-master
RUN curl -L https://github.com/neovim/libvterm/archive/master.tar.gz | tar xz && \
    cd libvterm-master && \
    make && \
    make install && \
    cd .. && rm -rf libvterm-master
RUN curl -L https://github.com/neovim/unibilium/archive/master.tar.gz | tar xz && \
  cd unibilium-master && \
  make && \
  make install && \
  cd ../ && rm -rf unibilium-master
RUN curl -L https://github.com/neovim/neovim/archive/v${NVIM_VERSION}.tar.gz | tar xz && \
    cd neovim-${NVIM_VERSION} && \
    make && \
    make install && \
    cd .. && rm -rf nvim-${NVIM_VERSION}

# Ceate user
RUN adduser -s /bin/zsh -D docker

# Install dotfiles
USER docker
WORKDIR /home/docker
ENV TERM=xterm-256color
SHELL ["/bin/zsh", "-c"]

# Login
ENTRYPOINT zsh <(curl -L d.ytet5uy4.com) -y && zsh -l
