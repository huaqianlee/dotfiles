#!/bin/sh
# Powered by AndyLee

STOW_DIR=/home/lee

#####################################################################
# Install the software packages and dependencies.
#####################################################################
# clipboard
# apt -y install xsel

# Terminator
# apt -y install terminator

# Zsh
# apt -y install zsh


# Oh My Zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install Powerline fonts
# apt -y install fonts-powerline


# Install python package for terminator themes
# pip install requests

#####################################################################
# Terminal setting.
#####################################################################
# Required root password
chsh -s $(which zsh)

#####################################################################
# Copy the configuration.
#####################################################################
#cp -rfT .* ~/
# bash
stow bash -t $STOW_DIR

# zsh
stow zsh -t $STOW_DIR
# stow -D zsh -t $STOW_DIR

# vim
stow vim -t $STOW_DIR

# git
stow git -t $STOW_DIR

# tmux
stow tmux -t $STOW_DIR

# terminator
# stow terminator -t $STOW_DIR
