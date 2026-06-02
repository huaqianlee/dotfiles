#!/bin/bash
# Powered by AndyLee

set -euo pipefail

STOW_DIR=$HOME
ZSH_CUSTOM=$HOME/.oh-my-zsh

#####################################################################
# Install packages and settings
#####################################################################

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure brew environment is loaded for this session
if command -v brew &>/dev/null; then
  eval "$(brew shellenv)"
fi

brew install zsh tmux fzf ripgrep bat exuberant-ctags cscope stow
brew install --cask font-powerline-symbols 2>/dev/null || true

# Uninstall first
stow -D zsh -t "$STOW_DIR"
stow -D vim -t "$STOW_DIR"
stow -D git -t "$STOW_DIR"
stow -D tmux -t "$STOW_DIR"
rm -rf "$HOME/.oh-my-zsh"

# zsh
echo "Installing zsh ..."
stow zsh -t "$STOW_DIR"

# vim
echo "Installing vim ..."
stow vim -t "$STOW_DIR"
mkdir -p "$HOME/vimtemp"
# YCM is managed by vim-plug in .vimrc — run PlugInstall after stow
vim +PlugInstall +qall 2>/dev/null || true

# git
echo "Installing git ..."
stow git -t "$STOW_DIR"

# tmux
echo "Installing tmux ..."
stow tmux -t "$STOW_DIR"

# Oh My Zsh
echo "Installing Oh My Zsh ..."
submodules/.oh-my-zsh/tools/install.sh --unattended --keep-zshrc

# autosuggestions
echo "Installing zsh-autosuggestions ..."
mkdir -p "$ZSH_CUSTOM/plugins"
cp -rf submodules/zsh-autosuggestions "$ZSH_CUSTOM/plugins/"

# Change shell to zsh if not already
ZSH_PATH="$(which zsh)"
if [ "$SHELL" != "$ZSH_PATH" ]; then
  # Homebrew zsh needs to be in /etc/shells
  if ! grep -q "$ZSH_PATH" /etc/shells 2>/dev/null; then
    echo "Adding $ZSH_PATH to /etc/shells ..."
    sudo sh -c "echo '$ZSH_PATH' >> /etc/shells"
  fi
  sudo chsh -s "$ZSH_PATH" "$USER"
fi

exec zsh -l
