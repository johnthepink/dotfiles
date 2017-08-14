# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh theme
# ZSH_THEME="robbyrussell"
# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
# oh-my-zsh plugins
plugins=(git osx hub)

source $ZSH/oh-my-zsh.sh

for file in ~/.{aliases,functions,keys,prompt}; do
  [ -r "$file" ] && source "$file"
done
unset file

export EDITOR="nvim"
export SHELL="zsh"

source ~/.antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$(yarn global bin):$PATH"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# added by travis gem
[ -f /Users/john.pinkerton/.travis/travis.sh ] && source /Users/john.pinkerton/.travis/travis.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=~/Library/Python/2.7/bin:$PATH

# go bin path
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Add the following to your shell init to set up gpg-agent automatically for every shell
if ! [ -n "$(pgrep gpg-agent)" ]; then
  eval $(gpg-agent --daemon)
fi

# local settings
source $HOME/.zshrc.local
