#! /bin/bash

sudo pacman -S --noconfirm --needed neovim go lua-language-server nodejs zsh fzf starship

yay -S --noconfirm --needed sesh-bin kanata-bin

if [ ! -d '$HOME/.tmux/plugins/tpm' ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

if [ ! -d '$HOME/.config/nvim' ]; then
  git clone git@github.com:alcb1310/nvim.git $HOME/.config/nvim
fi

if [ ! -d '$HOME/dotfiles' ]; then
  git clone git@github.com:alcb1310/dotfiles.git $HOME/dotfiles
fi

if [ ! -L "$HOME/.zshrc" ] || [ ! -e "$HOME/.zshrc" ]; then
  ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
fi

if [ ! -L "$HOME/.config/starship.toml" ] || [ ! -e "$HOME/.config/starship.toml" ]; then
  ln -s $HOME/dotfiles/.config/starship.toml $HOME/.config/starship.toml
fi

if [ ! -L "$HOME/.config/tmux" ] || [ ! -e "$HOME/.config/tmux" ]; then
  ln -s $HOME/dotfiles/.config/tmux $HOME/.config/tmux
fi

if [ ! -L "$HOME/.config/kanata" ] || [ ! -e "$HOME/.config/kanata" ]; then
  ln -s $HOME/dotfiles/.config/kanata $HOME/.config/kanata
fi

if [ ! -L "$HOME/.config/hypr" ] || [ ! -e "$HOME/.config/hypr" ]; then
  ln -s $HOME/dotfiles/.config/hypr $HOME/.config/hypr
fi

shell=$(which zsh)
echo "$shell"

chsh -s "$shell"
go install golang.org/x/tools/gopls@latest

/home/andres/.tmux/plugins/tpm/scripts/install_plugins.sh
