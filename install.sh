#!/bin/sh
# Powered by AndyLee

# USER_DIR=/home/lee
USER_DIR=$HOME
USER_PASSWD="a\n"
STOW_DIR=$USER_DIR
STOW_DIR=$USER_DIR
ZSH_CUSTOM=$USER_DIR/.oh-my-zsh

#####################################################################
# Install packdges and setting
#####################################################################
# clipboard
# apt -y install xsel
# For root privileges.
if [ "$(whoami)" != "root" ] # [ "$(UID)" != 0 ]
then
    printf  "%s" "$USER_PASSWD" | sudo -s <<EOF
    apt -y install zsh
    apt -y install tmux
    apt -y install fzf
    apt -y install vim-youcompleteme
    apt -y install fonts-powerline
    apt -y install ripgrep
    apt -y install bat
    # Universal Ctags is better, but need to intall it by compiling the
    # source code, especially for C++ new feature.
    apt -y install exuberant-ctags 
    apt -y install cscope
    apt -y install stow
    EOF
fi
# snap install universal-ctags

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
rm -rf $USER_DIR/.oh-my-zsh
# rm -rf $USER_DIR/.dir_colors
# rm -rf $USER_DIR/.solarized


# zsh
echo "Installing zsh ..."
stow zsh -t $STOW_DIR

echo "Installing vim ..."
stow vim -t $STOW_DIR
vam install youcompleteme
mkdir ~/vimtemp

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
# eval `printf "1\n1\nYES\n\n" | $USER_DIR/.solarized/install.sh`

eval $(printf  "%s" "$USER_PASSWD" | chsh -s $(which zsh))
exec zsh -l
