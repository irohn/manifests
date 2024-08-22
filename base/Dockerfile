FROM alpine:edge

### dependencies ###
RUN apk add --update \
    curl \
    wget \
    git \
    jq \
    fzf \
    zsh \
    build-base \
    ripgrep \
    fd \
    unzip \
    neovim \
    zoxide \
    eza \
    bat \
    rsync \
    tmux \
    python3 py3-pip

COPY ./config /root/.config

### shell setup ###
# https://github.com/deluan/zsh-in-docker - setup zsh in docker
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.0/zsh-in-docker.sh)" -- \
    -t robbyrussell \
    -p git \
    -p 'history-substring-search' \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
    -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down'

RUN echo 'for file in "$HOME"/.config/*.sh; do source $file; done' >> "$HOME"/.zshrc

# change default shell
RUN sed -i 's|/bin/sh$|/bin/zsh|' /etc/passwd

### neovim ###
RUN git clone --branch master --depth 1 https://github.com/irohn/nvim.git ~/.config/nvim
RUN nvim --headless "+Lazy! sync" +qa

WORKDIR /root

CMD [ "/usr/bin/env", "zsh" ]

