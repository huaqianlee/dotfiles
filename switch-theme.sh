#!/bin/bash
# Switch between terminal theme configurations
# Usage: ./switch-theme.sh [catppuccin|legacy]

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
THEME="${1:-}"

if [[ -z "$THEME" ]]; then
  echo "Usage: $0 <theme>"
  echo ""
  echo "Available themes:"
  echo "  catppuccin  - Powerlevel10k + Catppuccin Mocha (default, modern)"
  echo "  legacy      - Agnoster + custom dark theme (old config)"
  exit 1
fi

case "$THEME" in
  catppuccin)
    echo "Switching to Catppuccin Mocha + Powerlevel10k ..."
    cp "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
    cp "$DOTFILES_DIR/tmux/.tmux.conf" ~/.tmux.conf
    echo "✅ Applied: Powerlevel10k + Catppuccin Mocha"
    echo "   Restart iTerm2 and tmux for changes to take effect."
    ;;
  legacy)
    echo "Switching to legacy Agnoster theme ..."
    cp "$DOTFILES_DIR/zsh/legacy/.zshrc" ~/.zshrc
    cp "$DOTFILES_DIR/tmux/legacy/.tmux.conf" ~/.tmux.conf
    echo "✅ Applied: Agnoster + custom dark theme"
    echo "   Restart iTerm2 and tmux for changes to take effect."
    ;;
  *)
    echo "Unknown theme: $THEME"
    echo "Available: catppuccin, legacy"
    exit 1
    ;;
esac
