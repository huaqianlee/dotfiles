#!/bin/sh
# Powered by AndyLee

LEE_HOME=/home/lee
STOW_DIR=$LEE_HOME
ZSH_CUSTOM=$LEE_HOME/.oh-my-zsh

#####################################################################
# Install packdges and setting
#####################################################################
#cp -rfT .* ~/
# bash
#stow bash -t $STOW_DIR
# Uninstall first
stow -D zsh -t $STOW_DIR
stow -D vim -t $STOW_DIR
stow -D git -t $STOW_DIR
stow -D tmux -t $STOW_DIR
stow -D oh-my-zsh -t $STOW_DIR

# zsh
echo "Installing zsh ..."
# apt -y install zsh
stow zsh -t $STOW_DIR
eval `chsh -s $(which zsh)`

# vim
echo "Installing vim ..."
stow vim -t $STOW_DIR

# git
echo "Installing git ..."
stow git -t $STOW_DIR

# tmux
echo "Installing tmux ..."
stow tmux -t $STOW_DIR

# Terminator
# apt -y install terminator
# stow terminator -t $STOW_DIR
# git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.solarized
# cd ~/.solarized ; ./install.sh

# Oh My Zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Installing oh My Zsh ..."
#eval "$LEE_HOME/.oh-my-zsh/tools/install.sh"
rm -rf $LEE_HOME/.oh-my-zsh
eval "zsh/.oh-my-zsh/tools/install.sh"
#sh -c "$LEE_HOME/.oh-my-zsh/tools/install.sh"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# clipboard
# apt -y install xsel


# Install Powerline fonts
# apt -y install fonts-powerline

# Install python package for terminator themes
# pip install requests
