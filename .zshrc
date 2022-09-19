# default user
# export DEFAULT_USER="jmooring"
export DEFAULT_USER="jon"

# path modifications
export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# default pager
export PAGER="less -R"

# command aliases
alias c="code"
alias cdp="cd $HOME/Projects"
alias gfrom="g fetch && g rom"
alias rm="rm -i"
alias nvim="neovide"
alias v="nvim"
alias vc="c $HOME/.config/nvim/init.lua"
alias zc="c $HOME/.zshrc"
alias rand="openssl rand -base64"

# default editor
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR="vim"
else
	export EDITOR="code"
fi

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="agnoster"
plugins=(
	common-aliases
	docker
	git
	macos
	npm
	vscode
	yarn
	zsh-autosuggestions
	zsh-syntax-highlighting
)
source "$ZSH/oh-my-zsh.sh"

# fzf
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
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
