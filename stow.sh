#!/bin/sh

dotfiles=(bash \
          brew \
          gdb \
          git \
          karabiner \
          ranger \
          skhd \
          spacebar \
          tmux \
          vim \
          yabai \
          ycm \
          zsh)

for dotfile in "${dotfiles[@]}"; do
    stow -v -R -t ~ $dotfile
done
