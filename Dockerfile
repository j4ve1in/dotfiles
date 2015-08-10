FROM fedora:22
MAINTAINER j4ve1in

# Update and Install
RUN echo "fastestmirror=True" >> /etc/dnf/dnf.conf
RUN echo "timeout=10" >> /etc/dnf/dnf.conf
RUN dnf update -yq
RUN dnf install -yq sudo
RUN dnf install -yq passwd
RUN dnf install -yq findutils
RUN dnf install -yq git
RUN dnf install -yq tmux
RUN dnf install -yq vim
RUN dnf install -yq zsh
RUN dnf clean all -q

# Ceate user
## docker
RUN useradd -d /home/docker -m docker
RUN echo "docker" | passwd --stdin docker
RUN echo "docker ALL=(ALL) ALL" >> /etc/sudoers
## j4ve1in
RUN useradd -d /home/j4ve1in -m -s /bin/zsh j4ve1in
RUN echo "j4ve1in" | passwd --stdin j4ve1in

# Setup dotfiles
## Switch user
USER j4ve1in
WORKDIR /home/j4ve1in
ENV HOME /home/j4ve1in
## Install dotfiles
ENV TERM xterm-256color
ENV FULL_INSTALLATION 1
ENV ASSUME_YES 1
RUN bash -c "$(curl -L dot.j4ve1in.com)"

# Login
CMD ["echo", "Welcome"]
