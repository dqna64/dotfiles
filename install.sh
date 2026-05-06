#!/bin/bash

set -e

# === Clone this dotfiles repo if it does not already exist

if [ ! -d "$HOME/.dotfiles/" ]; then
	echo "Cloning https://github.com/dqna64/dotfiles into `$HOME/.dotfiles` as bare repo..."
	git clone --bare git@github.com:dqna64/dotfiles.git $HOME/.dotfiles
	
	# Create an alias for managing the dotfiles repo with git
	echo "Creating alias `dotfiles`..."
	alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

	# Hide untracked files (otherwise your entire home directory shows up in `git status`)
	dotfiles config --local status.showUntrackedFiles no

	# Checkout the dotfiles (will error if some files from dotfiles already
	# exist on your machine)
	dotfiles checkout		
else
	echo "$HOME/.dotfiles already exists. Please clone to a different path or remove existing directory." >&2
	exit 1
fi
	
# === Install oh-my-zsh

# https://ohmyz.sh/

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Downloading oh-my-zsh themes..."
echo "powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
echo "zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# === zsh

if [ "$SHELL" != "$which zsh)" ]; then
	echo "Changing default shell to zsh..."
	chsh -s $(which zsh)
fi

echo "Starting zsh..."
exec zsh

