#!/usr/bin/env bash

if [[ -z `xcode-select -p` ]]; then
	echo "Installing Xcode Command Line Tools..."
	xcode-select --install
	read -p "Press [Enter] key when install is complete."
else
	echo "Xcode Command Line Tools have already been installed."
fi

if [[ -z `which brew` ]]; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Homebrew has already been installed."
fi

homebrew_packages=(
	fzf
	git
	gnupg
	jq
	mas
	neovim
	openssl
	pinentry-mac
	ripgrep
	tree
	wget
	zsh
)


echo "Installing Homebrew packages..."
brew install ${homebrew_packages[@]}

homebrew_cask_packages=(
	1password
	discord
	dropbox
	fantastical
	google-chrome
	hpedrorodrigues/tools/dockutil
	iterm2
	middle
	mosaic
	neovide
	slack
	spotify
	visual-studio-code
	zoom
)

echo "Installing Homebrew Cask packages..."
brew install --cask ${homebrew_cask_packages[@]}

echo "Cleaning up Homebrew..."
brew cleanup

mac_app_store_apps=(
	937984704 # Amphetamine
	497799835 # Xcode
)

echo "Installing Mac App Store apps..."
mas install ${mac_app_store_apps[@]}

xcode_version=`xcodebuild -version | grep '^Xcode\s' | sed -E 's/^Xcode[[:space:]]+([0-9\.]+)/\1/'`
accepted_xcode_license_version=`defaults read /Library/Preferences/com.apple.dt.Xcode 2> /dev/null | grep IDEXcodeVersionForAgreedToGMLicense | cut -d '"' -f 2`

if [[ "$xcode_version" != "$accepted_xcode_license_version" ]]; then
	sudo xcodebuild -license accept
else
	echo "Xcode license has already been accepted."
fi

if [[ -f "$HOME/.fzf.zsh" ]]; then
	echo "fzf has already been configured."
else
	echo "Configuring fzf..."
	/usr/local/opt/fzf/install
fi

if [[ -d "$HOME/.nvm" ]]; then
	echo "nvm has already been installed."
else
	echo "Installing nvm..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
	nvm install default
fi

if [[ -d "$HOME/.oh-my-zsh" ]]; then
	echo "oh-my-zsh has already been installed."
else
	echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

fi

if [[ -d "$HOME/Projects" ]]; then
	echo "Projects directory has already been created."
else
	echo "Creating Projects directory..."
	mkdir "$HOME/Projects"
fi

if [[ -d "$HOME/Projects/fonts" ]]; then
	echo "Powerline fonts have already been installed."
else
	echo "Installing Powerline fonts..."
	cd ~/Projects
	git clone https://github.com/powerline/fonts.git --depth=1
	cd fonts
	./install.sh
	cd
fi

if [[ -d "$HOME/.git" ]]; then
  echo "dotfiles have already been initialized."
else
  echo "Initializing dotfiles..."
	git init
	git remote add origin --mirror=fetch https://github.com/portpaw/dotfiles.git
	git remote add origin --mirror=push git@github.com:portpaw/dotfiles.git
	git fetch
	git checkout -f main
fi

echo "Disabling Gatekeeper for Neovide..."
spctl --add /Applications/Neovide.app

echo "Setting Finder to show all filename extensions by default... "
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Enabling expanding the save panel by default..."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Disabling smart quotes and smart dashes..."
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "Setting default Finder view to columns..."
defaults write com.apple.Finder FXPreferredViewStyle Clmv

echo "Disabling the warning when changing a file extension..."
defaults write com.apple.Finder FXEnableExtensionChangeWarning -bool false

echo "Removing all existing dock apps..."
defaults write com.apple.dock show-recents -bool no
defaults write com.apple.dock recent-apps -array
dockutil --remove all --no-restart

echo "Adding favorite apps to dock..."
dockutil --add /Applications/Google\ Chrome.app --no-restart
dockutil --add /Applications/1Password.app --no-restart
dockutil --add /Applications/Visual\ Studio\ Code.app --no-restart
dockutil --add /Applications/Neovide.app --no-restart
dockutil --add /Applications/iTerm.app --no-restart
dockutil --add /Applications/zoom.us.app --no-restart
dockutil --add /System/Applications/Messages.app --no-restart
dockutil --add /Applications/Discord.app --no-restart
dockutil --add /Applications/Slack.app --no-restart
dockutil --add /Applications/Spotify.app --no-restart
killall Dock

echo "Enabling key repeating for Visual Studio Code..."
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

echo ""
echo "--------------------"
echo "| Manual Task List |"
echo "--------------------"
echo ""
echo "- Update internal keyboard modifier keys"
echo "- Update external display scaling and disable HDR"
echo "- Enable Apple Watch for unlocking apps and your Mac"
echo "- Set sample rate for DAC and speakers"
echo "- Update Sound settings to always show icon in menu bar"
echo "- Update Finder preferences to show the correct sidebar items"
echo "- Open 1password, log in, and enable SSH agent"
echo "- Open Dropbox, log in, and set up selective sync"
echo "- Open Fantastical, log in, add Google accounts, and set default calendar and task list"
echo "- Open iTerm and import settings"
echo "- Open Mosaic and import settings"
echo "- Open VS Code and import settings"
echo "- Open Spotify, log in, and disable open at login"
echo "- Open Chrome and log in"
echo "- Open Messages, log in, and enable Messages in iCloud"
echo "- Open Discord and log in"
echo "- Open Slack and log in to Atlassian Alumni and Browser Wranglers workspaces"
echo "- Update username in .zshrc"
echo "- Update email and GPG key in .gitconfig"
echo "- Download and install Elgato Control Center"
echo "  https://www.elgato.com/en/downloads"
echo "- Download and install Logitech G HUB, then disable open at login"
echo "  https://support.logi.com/hc/en-us/articles/360059428653-Download-Stub-PRO-X-SUPERLIGHT-Wireless-Gaming-Mouse"
echo "- Download and install Fujifilm X Webcam 2"
echo "  https://fujifilm-x.com/en-us/support/download/software/x-webcam"
