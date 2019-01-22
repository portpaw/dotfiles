# path modifications
export PATH=$HOME/.bin:/usr/local/bin:$PATH
export MANPATH=/usr/local/man:$MANPATH

# default pager
export PAGER='less -R'

# command aliases
alias c='code'
alias cdp='cd $HOME/Projects'
alias rm='rm -i'

# default editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# ohmyzsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME='agnoster'
plugins=(
  common-aliases
  docker
  encode64
  git
  httpie
  npm
  osx
  vscode
  yarn
)
source $ZSH/oh-my-zsh.sh

# nvm
export NVM_DIR="/Users/jon/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc