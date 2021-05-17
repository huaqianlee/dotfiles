#!/bin/sh
# Powered by AndyLee

LEE_HOME=/home/lee
STOW_DIR=$LEE_HOME
ZSH_CUSTOM=$LEE_HOME/.oh-my-zsh

#####################################################################
# Install packdges and setting
#####################################################################
# clipboard
# apt -y install xsel

# Install python package for terminator themes
# pip install requests

#cp -rfT .* ~/
# bash
#stow bash -t $STOW_DIR
# Uninstall first
stow -D zsh -t $STOW_DIR
stow -D vim -t $STOW_DIR
stow -D git -t $STOW_DIR
stow -D tmux -t $STOW_DIR
stow -D oh-my-zsh -t $STOW_DIR
rm -rf $LEE_HOME/.oh-my-zsh

# zsh
echo "Installing zsh ..."
apt -y install zsh
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

# Install Powerline fonts
apt -y install fonts-powerline

# Oh My Zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Installing oh My Zsh ..."
# eval "$LEE_HOME/.oh-my-zsh/tools/install.sh"
rm -rf $LEE_HOME/.oh-my-zsh
# execute install.sh in a new bash
# bash --rcfile <(echo '. ~/.bashrc; . zsh/.oh-my-zsh/tools/install.sh; mv $LEE_HOME/zsh-autosuggestions $ZSH_CUSTOM/plugins/')  &
# bash `. zsh/.oh-my-zsh/tools/install.sh; mv $LEE_HOME/zsh-autosuggestions $ZSH_CUSTOM/plugins/` &
eval `. zsh/.oh-my-zsh/tools/install.sh && mv $LEE_HOME/zsh-autosuggestions $ZSH_CUSTOM/plugins/` 

# solarized
# apt -y install dconf-cli
# git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.solarized
# cd ~/.solarized ; ./install.sh
# eval "zsh/.solarized/install.sh; zsh/.solarized/set_dark.sh"
# execute install.sh in a new bash
# bash --rcfile <(echo '. ~/.bashrc;. zsh/.solarized/install.sh;. zsh/.solarized/set_dark.sh') &

# autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# mv $LEE_HOME/zsh-autosuggestions $ZSH_CUSTOM/plugins/


