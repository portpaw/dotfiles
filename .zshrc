# path modifications
export PATH=$HOME/.bin:/usr/local/bin:$PATH
export MANPATH=/usr/local/man:$MANPATH

# default pager
export PAGER='less -R'

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

# nvm
export NVM_DIR="/Users/jon/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
