sudo pacman -Syyu
sudo pacman -S go

yay -S nvm
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc
source ~/.bashrc
nvm install --lts

sudo npm install -g yarn @nestjs/cli
