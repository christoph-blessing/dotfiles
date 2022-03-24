FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \ 
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    unzip \
    curl \
    doxygen \
    git \
    ripgrep \
    fd-find \
    wget \
    shellcheck \
    locales \
    python3-neovim \
    python3-dev \
    python3-setuptools \
    python3-pip \
    zsh \
    stow

ENV DEBIAN_FRONTEND=newt

RUN curl -o- https://deb.nodesource.com/setup_16.x | bash &&\
    apt-get install -y nodejs

RUN git clone https://github.com/neovim/neovim &&\
    cd neovim &&\
    make &&\
    make install &&\
    cd .. &&\
    rm -r neovim

RUN curl -O https://starship.rs/install.sh &&\
    sh install.sh --yes &&\
    rm install.sh

RUN pip3 install --no-cache-dir thefuck --user

COPY dotfiles dotfiles
RUN stow --dir dotfiles --target /root zshenv zsh starship nvim

ENV SHELL=/usr/bin/zsh
ENV USER=root

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen &&\
    locale-gen
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN nvim --headless -c 'autocmd User PackerComplete quitall'

ENTRYPOINT ["nvim"]
