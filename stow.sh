#!/bin/sh

dotfiles=(alacritty bash brew gdb git ranger skhd tmux vim yabai ycm zsh)

for dotfile in "${dotfiles[@]}";do
    stow -v -R -t ~ $dotfile
done
