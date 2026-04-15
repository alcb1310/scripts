#! /usr/bin/bash

sudo pacman -S --noconfirm --needed neovim tree-sitter-cli go lua-language-server nodejs npm zsh fzf starship ghostty wezterm wofi hyprpaper hyprlock hypridle waybar ttf-iosevka-nerd pnpm cmake pavucontrol less discord ttf-font-awesome qt6-svg qt6-declarative qt5-quickcontrols2 yazi tldr fd ripgrep xdg-desktop-portal-hyprland tmux zoxide

yay -S --noconfirm --needed sesh-bin kanata-bin docker-git brave-bin

if [ e $HOME/.config/hypr ]; then
    mv $HOME/.config/hypr $HOME/.config/hypr.bak
fi

if [ ! -d '$HOME/.tmux/plugins/tpm' ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

if [ ! -d '$HOME/.config/nvim' ]; then
  git clone https://github.com/alcb1310/nvim $HOME/.config/nvim
fi

if [ ! -d '$HOME/dotfiles' ]; then
  git clone https://github.com/alcb1310/dotfiles $HOME/dotfiles

  ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
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

if [ ! -L "$HOME/.config/ghostty" ] || [ ! -e "$HOME/.config/ghostty" ]; then
  ln -s $HOME/dotfiles/.config/ghostty $HOME/.config/ghostty
fi

if [ ! -L "$HOME/.config/wezterm" ] || [ ! -e "$HOME/.config/wezterm" ]; then
  ln -s $HOME/dotfiles/.config/wezterm $HOME/.config/wezterm
fi

if [ ! -L "$HOME/.config/wofi" ] || [ ! -e "$HOME/.config/wofi" ]; then
  ln -s $HOME/dotfiles/.config/wofi $HOME/.config/wofi
fi

if [ ! -L "$HOME/.config/waybar" ] || [ ! -e "$HOME/.config/waybar" ]; then
  ln -s $HOME/dotfiles/.config/waybar $HOME/.config/waybar
fi

if [ ! -L "$HOME/.config/git" ]; then
  ln -s $HOME/dotfiles/.config/git $HOME/.config/git
  rm $HOME/.gitconfig
fi

shell=$(which zsh)
echo "$shell"

chsh -s "$shell"
go install golang.org/x/tools/gopls@latest
go install mvdan.cc/gofumpt@latest
go install -v github.com/incu6us/goimports-reviser/v3@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/air-verse/air@latest

/home/andres/.tmux/plugins/tpm/scripts/install_plugins.sh

sudo npm install -g @biomejs/biome emmet-ls @tailwindcss/language-server typescript-language-server

sudo usermod -aG docker ${USER}

source $HOME/.bashrc

echo "To setup kanata please follow the documentaton at: "
echo "https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md"
