echo "symlinking main files"
ln -sf ~/.dotfiles/aliases ~/.aliases
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/prompt ~/.prompt
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/zshenv ~/.zshenv
ln -sf ~/.dotfiles/zshrc ~/.zshrc

echo "symlinking karabiner config"
mkdir -p ~/.config/karabiner
ln -sf ~/.dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

echo "symlinking neovim config"
mkdir -p ~/.config/nvim
ln -sf ~/.dotfiles/vimrc ~/.config/nvim/init.vim

echo "symlinking hammerspoon config"
mkdir .hammerspoon
ln -sf ~/.dotfiles/hammerspoon/init.lua ~/.hammerspoon/init.lua

echo "symlinking gpg config"
mkdir ~/.gnupg
ln -sf ~/.dotfiles/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -sf ~/.dotfiles/gpg.conf ~/.gnupg/gpg.conf

echo "adding italic terminfos"
tic assets/tmux-256color-italic.terminfo
tic assets/xterm-256color-italic.terminfo

echo "installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "installing node"
brew install node

echo "installing yarn"
brew install yarn

echo "installing ruby"
brew install ruby

echo "installing hub"
brew install hub

echo "installling gpg"
brew install gpg gpg-agent pinentry-mac

echo "installing tmux"
brew install tmux
mkdir -p ~/.tmux/plugins

echo "installing pythons"
brew install python python3

echo "installing neovim"
brew tap neovim/neovim
brew install --HEAD neovim
pip install neovim
pip3 install neovim
gem install neovim
