export PATH=~/.bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH
export MANPATH=/usr/local/man:$MANPATH

# ohmyzsh settings
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME='robbyrussell'
export UPDATE_ZSH_DAYS=7

# ohmyzsh plugins
plugins=(bower brew colorize common-aliases copydir copyfile django encode64 extract fabric git github mercurial npm osx python pip virtualenvwrapper)

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
alias cdbb='cd $HOME/Projects/bitbucket && workon bitbucket'
alias bower='noglob bower'
alias rm='rm -i'

# default editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# default pager
export PAGER='less -R'

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENV_USE_DISTRIBUTE=1
[[ -n '$(command -v virtualenvwrapper.sh)' ]] && source virtualenvwrapper.sh

# python
export PYTHONDONTWRITEBYTECODE=1
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache

# java
export MAVEN_OPTS='-Xmx1024m -XX:MaxPermSize=128m'
export JAVA_HOME=$(/usr/libexec/java_home)

# C compiler flags
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
