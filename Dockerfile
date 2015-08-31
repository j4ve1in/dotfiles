FROM fedora:22
MAINTAINER j4ve1in

# Update and Install packages
RUN echo "fastestmirror=True" >> /etc/dnf/dnf.conf && \
    dnf update -yq --setopt=deltarpm=no && \
    dnf install -yq \
        sudo passwd git \
        tmux vim zsh \
        gcc make findutils tree procps-ng && \
    dnf clean all -q

# Ceate user
RUN useradd -d /home/j4ve1in -m -s /bin/zsh j4ve1in && \
    echo "j4ve1in" | passwd --stdin j4ve1in && \
    echo "j4ve1in ALL=(ALL) ALL" >> /etc/sudoers

# Install dotfiles
USER j4ve1in
WORKDIR /home/j4ve1in
ENV HOME=/home/j4ve1in \
    HOSTNAME=docker \
    TERM=xterm-256color \
    FULL_INSTALLATION=1 \
    ASSUME_YES=1
RUN bash -c "bash <(curl -LsS dot.j4ve1in.com) >/dev/null 2>&1"

# Login
ENTRYPOINT ["zsh"]
CMD ["--login"]
