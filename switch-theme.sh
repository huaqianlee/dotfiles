#!/bin/bash
# Switch between terminal theme configurations
# Usage: ./switch-theme.sh [catppuccin|legacy]
#
# Sensitive info (API keys, tokens, etc.) lives in ~/.zshrc.local
# and is preserved across theme switches. It is NOT tracked by git.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
THEME="${1:-}"

if [[ -z "$THEME" ]]; then
  echo "Usage: $0 <theme>"
  echo ""
  echo "Available themes:"
  echo "  catppuccin  - Powerlevel10k + Catppuccin Mocha (default, modern)"
  echo "  legacy      - Agnoster + custom dark theme (old config)"
  echo ""
  echo "Note: ~/.zshrc.local (secrets) is preserved across switches."
  exit 1
fi

# Ensure ~/.zshrc.local exists with a reminder comment
if [[ ! -f ~/.zshrc.local ]]; then
  cat > ~/.zshrc.local << 'EOF'
# Local secrets — not tracked by git, preserved across theme switches
# Add API keys, tokens, proxy settings, etc. here
EOF
  echo "📝 Created ~/.zshrc.local — add your secrets there."
fi

case "$THEME" in
  catppuccin)
    echo "Switching to Catppuccin Mocha + Powerlevel10k ..."
    cp "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
    cp "$DOTFILES_DIR/tmux/.tmux.conf" ~/.tmux.conf
    echo "✅ Applied: Powerlevel10k + Catppuccin Mocha"
    ;;
  legacy)
    echo "Switching to legacy Agnoster theme ..."
    cp "$DOTFILES_DIR/zsh/legacy/.zshrc" ~/.zshrc
    cp "$DOTFILES_DIR/tmux/legacy/.tmux.conf" ~/.tmux.conf
    echo "✅ Applied: Agnoster + custom dark theme"
    ;;
  *)
    echo "Unknown theme: $THEME"
    echo "Available: catppuccin, legacy"
    exit 1
    ;;
esac

echo "   ~/.zshrc.local secrets: preserved ✅"
echo "   Restart iTerm2 and tmux for changes to take effect."
