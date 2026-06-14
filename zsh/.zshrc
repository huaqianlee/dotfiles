# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Homebrew USTC mirror
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export CSCOPE_DB=~/data/ctags/cscope.out

# History configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Powerlevel10k (loaded via source below, not ZSH_THEME)
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  history-substring-search
  zsh-syntax-highlighting
)

# Make autosuggestions visible on dark backgrounds
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5F5F5F"

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

# ls with colors (macOS uses -G instead of --color)
export CLICOLOR=1
alias ls='ls -G'

# My aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CFh'
alias lg='ll -a | grep '
alias hg='history | grep '
alias hv='history | vim -'
alias mv="mv -v"
alias rm="rm -vi"
alias cp="cp -v"
alias myip="ipconfig getifaddr en0 2>/dev/null || ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# Platform-specific aliases
if [[ "$(uname)" == "Darwin" ]]; then
  export CLICOLOR=1
  alias ls='ls -G'
  alias copy='pbcopy'
  alias paste='pbpaste'
  alias vimclipboard='pbpaste | vim -'
else
  alias copy='xsel -ib'
  alias paste='xsel --clipboard'
  alias vimclipboard='paste | vim -'
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
  alias install="sudo apt install "
  alias update="sudo apt update"
fi

# Configure Ctrl+U to backward-kill-line not kill-whole-line
bindkey \^U backward-kill-line
bindkey \^G kill-whole-line

# History substring search keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR

# Powerlevel10k theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/Users/sarah.qin/.bun/_bun" ] && source "/Users/sarah.qin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Export
export FZF_DEFAULT_COMMAND='rg --files --sortr modified'

. "$HOME/.local/bin/env"
