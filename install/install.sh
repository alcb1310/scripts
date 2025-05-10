#! /bin/bash

sudo pacman -S --noconfirm --needed neovim go lua-language-server nodejs zsh fzf starship

yay -S --noconfirm --needed sesh-bin

shell=$(which zsh)
echo "$shell"

chsh -s "$shell"
go install golang.org/x/tools/gopls@latest
