#!/bin/bash

dotfiles=( \
    bash \
    brew \
    gdb \
    git \
    p10k \
    skhd \
    spacebar \
    tig \
    tmux \
    vim \
    yabai \
    ycm \
    zsh \
)

for dotfile in "${dotfiles[@]}"; do
    stow -v -R -t ~ $dotfile
done

configs=( \
    karabiner \
    ranger \
)

for config in "${configs[@]}"; do
    stow -v -R -t ~/.config/$config $config
done
