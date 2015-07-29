ZSH=$HOME/.oh-my-zsh
ZSH_THEME="naveed"

plugins=(git)
source $ZSH/oh-my-zsh.sh

export PATH=./rbin:./bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/local/bin:$PATH

eval "$(rbenv init -)"

# To get ctags to work with vim
# alias ctags="`brew --prefix`/bin/ctags"

source ~/.fresh/build/shell.sh
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
