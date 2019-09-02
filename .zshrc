# path modifications
export PATH=$HOME/.bin:$HOME/Library/Android/sdk:$HOME/Library/Android/sdk/platform-tools:/usr/local/bin:$PATH
export MANPATH=/usr/local/man:$MANPATH

# default pager
export PAGER='less -R'

# command aliases
alias c='code'
alias cdp='cd $HOME/Projects'
alias rm='rm -i'
alias v='mvim'
alias vc='v $HOME/.vimrc'
alias zc='c $HOME/.zshrc'
alias rand='openssl rand -base64'

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
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh