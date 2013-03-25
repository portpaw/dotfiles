# ohmyzsh settings
ZSH=$HOME/.oh-my-zsh
ZSH_THEME='robbyrussell'

# ohmyzsh plugins
plugins=(osx brew sublime git mercurial python pip virtualenvwrapper django npm)

source $ZSH/oh-my-zsh.sh

# ridiculous path
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/local/share/npm/bin:/usr/bin:/usr/sbin:/bin:/sbin

# shortcuts
alias ll='ls -lah'
alias vc='mvim $HOME/.vimrc'
alias zc='mvim $HOME/.zshrc'
alias cdbb='cd $HOME/Projects/bitbucket'
alias cdboom='cd $HOME/Projects/boomtown'

# default pager
export PAGER='less -R'

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENV_USE_DISTRIBUTE=1
[[ -n '$(command -v virtualenvwrapper.sh)' ]] && source virtualenvwrapper.sh
