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
rm -rf $LEE_HOME/.oh-my-zsh
# rm -rf $LEE_HOME/.dir_colors
# rm -rf $LEE_HOME/.solarized

# For root privileges.
if [ "$(whoami)" != "root" ] # [ "$(UID)" != 0 ]
then
printf "a\n" | sudo -s <<EOF
	apt -y install zsh
	apt install tmux
	apt -y install fonts-powerline
EOF
fi

# zsh
echo "Installing zsh ..."
stow zsh -t $STOW_DIR

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
# apt -y install fonts-powerline

# Oh My Zsh
echo "Installing oh My Zsh ..."
eval "submodules/.oh-my-zsh/tools/install.sh --unattended --keep-zshrc" 

# autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp -rf submodules/zsh-autosuggestions $ZSH_CUSTOM/plugins/

# solarized
# git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.solarized
# echo "Installing solarized ..."
# eval `printf "1\n1\nYES\n\n" | $LEE_HOME/.solarized/install.sh`

eval `printf "a\n" | chsh -s $(which zsh)`
exec zsh -l
