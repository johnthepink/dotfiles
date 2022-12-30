# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh theme
# ZSH_THEME="robbyrussell"
# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
# oh-my-zsh plugins
plugins=(
  git
  macos
)

source $ZSH/oh-my-zsh.sh

for file in ~/.{aliases,functions,keys,prompt}; do
  [ -r "$file" ] && source "$file"
done
unset file

export EDITOR="nvim"
export SHELL="zsh"
export LANG="en_US.UTF-8"

# set path for homebrew
eval "$(/opt/homebrew/bin/brew shellenv)" 

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
export PATH=$(pyenv root)/shims:$PATH

# go bin path
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# my bin
export PATH=$PATH:~/.dotfiles/bin

# Add the following to your shell init to set up gpg-agent automatically for every shell
if ! [ -n "$(pgrep gpg-agent)" ]; then
  eval $(gpg-agent --daemon)
fi

eval "`fnm env --use-on-cd`"

export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

function v2g() {
  ffmpeg -i "$1" -pix_fmt rgb8 -r 10 "$2" && gifsicle -O3 "$2" -o "$2"
}

# local settings
source $HOME/.zshrc.local

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/john/code/monorepo/services/graphql-app/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/john/code/monorepo/services/graphql-app/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/john/code/monorepo/services/graphql-app/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/john/code/monorepo/services/graphql-app/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/john/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/john/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh
