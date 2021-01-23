#!/bin/sh

dotfiles=(bash \
          brew \
          gdb \
          git \
          karabiner \
          p10k \
          ranger \
          skhd \
          spacebar \
          tig \
          tmux \
          vim \
          yabai \
          ycm \
          zsh)

for dotfile in "${dotfiles[@]}"; do
    stow -v -R -t ~ $dotfile
done
