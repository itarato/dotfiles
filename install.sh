#! /bin/zsh

if ! command -v rg &> /dev/null; then
  sudo apt-get install -y htop mc
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/screenrc ~/.screenrc

. ~/.zshrc
. ~/.bashrc

cp -f ~/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

cartridge insert itarato
cp -f ~/.data/cartridges/itarato/rails_init/*.rb ~/src/github.com/Shopify/shopify/config/initializers/
cp -rf ~/.data/cartridges/itarato/idbg_scripts ~/src/github.com/Shopify/shopify/

touch /tmp/idbg_log.txt
