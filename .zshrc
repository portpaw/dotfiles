# ridiculous PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/local/share/npm/bin:/usr/bin:/usr/sbin:/bin:/sbin:~/.scripts

# ohmyzsh settings
ZSH=$HOME/.oh-my-zsh
ZSH_THEME='robbyrussell'

# ohmyzsh plugins
plugins=(osx brew sublime git mercurial python pip virtualenvwrapper django npm)

source $ZSH/oh-my-zsh.sh

# shortcuts
alias v='mvim'
alias ll='ls -lah'
alias gdc='git dc'
alias gs='git status'
alias vc='mvim $HOME/.vimrc'
alias zc='mvim $HOME/.zshrc'
alias cdp='cd $HOME/Projects'
alias cddot='cd $HOME/Projects/dotfiles'
alias cdbb='cd $HOME/Projects/bitbucket'
alias cdboom='cd $HOME/Projects/boomtown'

# default pager
export PAGER='less -R'

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENV_USE_DISTRIBUTE=1
[[ -n '$(command -v virtualenvwrapper.sh)' ]] && source virtualenvwrapper.sh
