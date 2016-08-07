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

export EDITOR="vim"
export SHELL="zsh"

source ~/antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply
