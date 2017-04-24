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

# Kubernetes and docker helpers
function dx {
  docker exec -it $(docker ps --format "{{.Names}}" --filter "name=$1") bash
}

function dq {
  docker stop $(docker ps --format "{{.Names}}" --filter "name=$1")
}

function kx {
  echo "Connecting to ${1:-latest} ${2:-site}"
  kubectl exec -it -n ${1:-latest} $(kubectl get po -n ${1:-latest} -l app=${2:-site} -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase --no-headers | grep Running | head -1 | awk '{ print $1 }') -c ${2:-site} /bin/bash
}
