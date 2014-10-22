# ridiculous PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/bin:/usr/sbin:/bin:/sbin:~/.scripts

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
alias grh='git reset --hard'
alias vc='mvim $HOME/.vimrc'
alias zc='mvim $HOME/.zshrc'
alias cdp='cd $HOME/Projects'
alias cdbb='cd $HOME/Projects/bitbucket'
alias bower='noglob bower'

# default pager
export PAGER='less -R'

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENV_USE_DISTRIBUTE=1
[[ -n '$(command -v virtualenvwrapper.sh)' ]] && source virtualenvwrapper.sh

# clang settings to avoid stupid compiler errors
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# check out all branches locally
gcoa() {
    if [[ $1 = '' ]]; then
        local remote='origin'
    else
        local remote=$1
    fi
    local branches="$(git branch -r | grep $remote | grep -v master | grep -v HEAD | awk '{gsub(/'$remote'\//, "", $1); print $1}')"
    branches=("${(f)branches}")
    for branch in $branches; do git checkout $branch; done
}

# base64-encode files
encode() {
  local mime=`file --mime-type $1 | cut -d\: -f2- | cut -d\  -f2`
  local b64=`openssl base64 < $1 | tr -d '\n'`
  echo 'data:'$mime';base64,'$b64 | pbcopy
}
