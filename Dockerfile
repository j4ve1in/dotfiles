FROM fedora:22
MAINTAINER ytet5uy4

# Update and Install packages
RUN echo "fastestmirror=True" >> /etc/dnf/dnf.conf && \
    dnf update -yq --setopt=deltarpm=no && \
    dnf install -yq \
        sudo passwd git \
        tmux vim zsh \
        gcc make findutils procps-ng && \
    dnf clean all -q

# Ceate user
RUN useradd -d /home/ytet5uy4 -m -s /bin/zsh ytet5uy4 && \
    echo "ytet5uy4" | passwd --stdin ytet5uy4 && \
    echo "ytet5uy4 ALL=(ALL) ALL" >> /etc/sudoers

# Install dotfiles
USER ytet5uy4
WORKDIR /home/ytet5uy4
ENV HOME=/home/ytet5uy4 \
    HOSTNAME=docker \
    TERM=xterm-256color
RUN bash -c "bash <(curl -LsS d.ytet5uy4.com) -yf >/dev/null 2>&1"

# Login
ENTRYPOINT ["zsh"]
CMD ["--login"]
