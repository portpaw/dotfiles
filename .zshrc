export PATH=~/.bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH
export MANPATH=/usr/local/man:$MANPATH

# ohmyzsh settings
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME='robbyrussell'
export UPDATE_ZSH_DAYS=7

# ohmyzsh plugins
plugins=(bower brew common-aliases fabric git mercurial npm nyan osx pip python sudo vagrant virtualenvwrapper web-search)

source $ZSH/oh-my-zsh.sh

# shortcuts
alias v='mvim'
alias gdc='git dc'
alias gs='git status'
alias grh='git reset --hard'
alias vc='mvim $HOME/.vimrc'
alias zc='mvim $HOME/.zshrc'
alias cdp='cd $HOME/Projects'
alias cdbb='cd $HOME/Projects/bitbucket && workon bitbucket'
alias bower='noglob bower'

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

testbb() {
    local host='dev.bitbucket.org:8000'

    while [[ $# > 1 ]] do
        local key="$1"

        case $key in
            -h)
                host="$2"
                shift # past argument
            ;;
        esac

        shift # past argument or value
    done

    if [[ $host = 'dev.bitbucket.org:8000' ]]; then
        local protocol='http'
        local ssh_host='localhost'
    else
        local protocol='https'
        local ssh_host=$host
    fi

    if [[ $1 = '' ]]; then
        local tests='tests/selenium'
    else
        local tests=$1
    fi

    TEST_BASE_URL=$protocol'://'$host TEST_GIT_URL=$protocol'://'$host TEST_HG_URL=$protocol'://'$host TEST_SSH_URL=$ssh_host TEST_FIREFOX_BINARY=/Applications/Firefox.app/Contents/MacOS/firefox-bin nosetests --nocapture $tests
}



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="/Users/jmooring/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
