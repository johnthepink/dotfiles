# Path to your oh-my-zsh installation.
export ZSH=/Users/john/.oh-my-zsh

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

source ~/antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

export NVM_DIR="/Users/john/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# setup gpg agent
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi