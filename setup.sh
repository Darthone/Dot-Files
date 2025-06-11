#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install starship jq fzf nvim
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

cd 
# clone ssh version since https is no longer supported
git clone git@github.com:Darthone/Dot-Files.git .dotfiles/;

cd .dotfiles/
git submodule update --init # pull dotsync bin
cp dotsyncrc ~/.dotsyncrc # bootstrap


hostname


# put hostname into dotsync
vi ~/.dotsyncrc

~/.dotfiles/dotsync/bin/dotsync -L

touch ~/.localrc
# Add any specific local only configs

source ~/.config/fish/config.fish
# install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher update

# open neovim to install plugins
nvim

