#! /bin/bash

sudo pacman -S --noconfirm --needed neovim go lua-language-server nodejs npm zsh fzf starship ghostty wezterm wofi hyprpaper hyprlock hypridle waybar ttf-iosevka-nerd pnpm cmake

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

shell=$(which zsh)
echo "$shell"

chsh -s "$shell"
go install golang.org/x/tools/gopls@latest
go install mvdan.cc/gofumpt@latest
go install -v github.com/incu6us/goimports-reviser/v3@latest
go install github.com/go-delve/delve/cmd/dlv@latest

/home/andres/.tmux/plugins/tpm/scripts/install_plugins.sh

sudo npm install -g @biomejs/biome emmet-ls @tailwindcss/language-server typescript-language-server

git config --global pull.rebase false

git config --global alias.l "log --oneline"
git config --global alias.l1 "log --oneline -n 10"
git config --global alias.l2 "log --oneline -n 20"
git config --global alias.l3 "log --oneline -n 30"
git config --global alias.l4 "log --oneline -n 40"
git config --global alias.st "status -s"
git config --global alias.c "commit -v"
git config --global alias.dw "diff --word-diff"

git config --global push.autoSetupRemote true
git config --global push.default current
git config --global push.followTags true

git config --global fetch.prune true

git config --global diff.algorithm histogram
git config --global diff.colorMoved plain
git config --global core.editor nvim

git config --global merge.conflictstyle diff3

echo "To setup kanata please follow the documentaton at: "
echo "https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md"
