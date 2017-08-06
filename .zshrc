export PATH=~/.bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH
export MANPATH=/usr/local/man:$MANPATH

# ohmyzsh settings
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME='robbyrussell'
export UPDATE_ZSH_DAYS=7

# ohmyzsh plugins
plugins=(brew common-aliases git mercurial npm osx sudo)

source $ZSH/oh-my-zsh.sh

# shortcuts
alias a='atom'
alias zc='atom $HOME/.zshrc'
alias gdc='git dc'
alias gs='git status'
alias grh='git reset --hard'
alias cdp='cd $HOME/Projects'
alias rm='rm -i'

# default editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='atom'
fi

# default pager
export PAGER='less -R'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_DIR="/Users/jon/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
