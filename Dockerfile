FROM alpine:3.4
MAINTAINER ytet5uy4

# Update and Install packages
RUN apk update && apk upgrade && \
    apk add --no-cache curl git zsh vim tmux gcc make coreutils \
    python py-pip && pip install powerline-status

# Ceate user
RUN adduser -s /bin/zsh -D docker

# Install dotfiles
USER docker
WORKDIR /home/docker
ENV SHELL=/bin/zsh TERM=xterm-256color
RUN zsh -c "zsh <(curl -LsS d.ytet5uy4.com) -yf"

# Login
ENTRYPOINT ["zsh"]
CMD ["--login"]
