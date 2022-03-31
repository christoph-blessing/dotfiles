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
    python3-dev \
    python3-setuptools \
    python3-pip \
    zsh \
    stow \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

ENV DEBIAN_FRONTEND=newt

RUN curl -o- https://deb.nodesource.com/setup_16.x | bash &&\
    apt-get install -y nodejs

RUN git clone --depth 1 https://github.com/neovim/neovim &&\
    cd neovim &&\
    make CMAKE_BUILD_TYPE=RelWithDebInfo &&\
    make install &&\
    cd .. &&\
    rm -r neovim

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&\
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null &&\
    apt-get update && apt-get install -y docker-ce-cli

RUN curl -O https://starship.rs/install.sh &&\
    sh install.sh --yes &&\
    rm install.sh

RUN pip3 install --no-cache-dir thefuck neovim pre-commit

RUN npm install -g fd-find neovim

COPY dotfiles dotfiles
RUN stow --dir dotfiles --target /root zshenv zsh starship nvim git

ENV SHELL=/usr/bin/zsh
ENV USER=root

RUN zsh -c 'echo allow-preset-passphrase > $GNUPGHOME/gpg-agent.conf'

COPY docker /opt/docker

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen &&\
    locale-gen
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN nvim --headless -c 'autocmd User PackerComplete quitall'

ENTRYPOINT ["/opt/docker/entrypoint.sh"]
