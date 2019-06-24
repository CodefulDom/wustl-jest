#!/bin/bash

# force rename to proper directory
if [ ! "$PWD" == "$HOME"/.config ]; then
  mv "PWD" ~/.config/
fi

# adding homebrew if you don't whave it
if [ ! $(which brew) ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# forumulae
brew upgrade
brew install ruby git fd bat neovim ripgrep htop fzf emojify httpie z tree
brew install koekeishiya/formulae/skhd

# services
brew services start chunkwm
brew services start skhd

# brew cask
brew tap caskroom/cask

# terminal configuration
export ZSH="$HOME/.config/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# symlink config files
rm ~/.zshrc
ln -sf ~/.config/.*rc ~

# NVM install node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.zshrc
nvm install node

# neovim providers
pip3 install --user neovim
npm install -g neovim
gem install neovim

# iTerm2
cp ~/.config/iTerm2/com.googlecode.iterm2.plist ~/Library/Preferences/

# VS Code
brew cask install visual-studio-code

# Docker Install
brew cask install docker
open /Applications/Docker.app
sudo systemctl enable docker

# Slack
cat ~/.config/slack-dark.js >> /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js

# install yarn
brew install yarn

# google cloud utils
curl https://sdk.cloud.google.com | zsh
exec -l $SHELL

# exit message
echo -e "\n=================\n"
echo 
echo "Configuration complete! Please restart your terminal"
