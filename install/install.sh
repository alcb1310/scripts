git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
     sudo pacman -S alacritty neovim tmux ripgrep
     yay -S ttf-font-nerd
     bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
     mv ~/.bashrc ~/.bashrc.old
     ln -s ~/.dotfiles/.bashrc ~/.bashrc
     ln -s ~/.dotfiles/tmux/ ~/.config/tmux
elif [[ "$OSTYPE" == "darwin"* ]]; then
     /bin/bash -c "$(curl fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
     git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
     git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
     git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
     brew tap homebrew/cask-fonts
     brew install --cask alacritty font-hack-nerd-font
     brew install neovim tmux nvm go gh
     ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
     mv ~/.zshrc ~/.zshrc.old
     ln -s ~/.dotfiles/.zshrc ~/.zshrc
     ln -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
fi

ln -s ~/.dotfiles/alacritty/ ~/.config/alacritty
ln -s ~/.dotfiles/nvim/ ~/.config/nvim
~/.tmux/plugins/tpm/scripts/install_plugins.sh
