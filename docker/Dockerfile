ARG PYTHON_VERSION
FROM python:$PYTHON_VERSION

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
    zsh \
    stow \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    exa

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&\
    chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&\
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null &&\
    apt-get update &&\
    apt-get install -y gh

ENV DEBIAN_FRONTEND=newt

RUN curl -o- https://deb.nodesource.com/setup_16.x | bash &&\
    apt-get install -y nodejs

RUN git clone --depth 1 https://github.com/neovim/neovim &&\
    cd neovim &&\
    make CMAKE_BUILD_TYPE=RelWithDebInfo &&\
    make install &&\
    cd .. &&\
    rm -r neovim

RUN mkdir -p /etc/apt/keyrings &&\
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg &&\
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null &&\
    apt-get update && apt-get install -y docker-ce-cli docker-compose-plugin

RUN curl -O https://starship.rs/install.sh &&\
    sh install.sh --yes &&\
    rm install.sh

RUN pip3 install --no-cache-dir thefuck neovim pre-commit

RUN npm install --location=global fd-find neovim

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen &&\
    locale-gen
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

ENV SHELL=/usr/bin/zsh

ARG DOTFILES_REF
LABEL dotfiles.ref=$DOTFILES_REF
ENV DOTFILES_DIR=/root/dotfiles
RUN git clone https://github.com/cblessing24/dotfiles $DOTFILES_DIR &&\
    cd $DOTFILES_DIR &&\
    git checkout $DOTFILES_REF &&\
    stow --dir $DOTFILES_DIR/dotfiles --target $HOME zshenv zsh starship nvim git gh

RUN zsh -c 'echo allow-preset-passphrase > $GNUPGHOME/gpg-agent.conf'

RUN nvim --headless -c 'autocmd User PackerComplete quitall' &&\
    nvim --headless +'LspInstall --sync pyright' +'quitall'

ENV SHELL=/usr/bin/zsh

ENV ZSH_DIR=/root/zsh
COPY zsh $ZSH_DIR
ENV ZSHRC_HOOK=$ZSH_DIR/zshrc
ENTRYPOINT ["/usr/bin/zsh"]
