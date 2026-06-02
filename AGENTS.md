# dotfiles — AGENTS.md

Personal dotfiles for huaqianlee (AndyLee). Managed via **GNU stow** — each top-level directory is a stow package linked to `$HOME`.

## Installation

```bash
git clone --recursive https://github.com/huaqianlee/dotfiles.git
./install.sh          # Linux (apt-based)
./mac_install.sh      # macOS (brew-based)
```

Both scripts use the same flow: `stow -D` (unstow) → `rm -rf ~/.oh-my-zsh` → `stow <pkg> -t $HOME`. Linux version uses `sudo -v` to prompt for credentials upfront, then runs `apt install`. macOS version auto-installs Homebrew if missing, then uses `brew install`. Both use `#!/bin/bash` (bash for `set -o pipefail` support).

After install, Oh My Zsh is bootstrapped from `submodules/.oh-my-zsh/tools/install.sh --unattended --keep-zshrc`. The shell is changed to zsh via `chsh`.

## Dotfile layout

| Package dir | Target path | Contents |
|---|---|---|
| `zsh/` | `~/.zshrc` | zsh config + Oh My Zsh (agnoster theme), zsh-syntax-highlighting, zsh-autosuggestions |
| `vim/` | `~/.vimrc` | vim-plug with 40+ plugins, YCM, markdown-preview, python-mode, airline |
| `git/` | `~/.gitconfig` | git aliases (st, lo, lg, cp, co, cm, br, df, sneak, undo), credential store, editor=vim |
| `tmux/` | `~/.tmux.conf` | vi mode keys, Alt+arrow pane switch, mouse on, 256-color/tmux-256color, 50k history |
| `bash/` | `~/.bashrc` | fallback bash config with NVM, FZF via ripgrep |
| `terminator/` | `~/.config/terminator/config` | Solarized themes, TerminatorThemes plugin |
| `config/mpv/` | `~/.config/mpv/` | mpv with GPU-hq profile, ICC color, interpolation, auto-safe HW decode, OSC off |

Note: `bash/` and `terminator/` packages are **present but commented out** in both install scripts. To link them manually: `stow bash -t $HOME` / `stow terminator -t $HOME`.

## Submodules

- `submodules/.oh-my-zsh` — ohmyzsh framework
- `zsh/.zsh-syntax-highlighting` — zsh syntax highlighting
- `submodules/zsh-autosuggestions` — zsh autosuggestions (installed to `$ZSH_CUSTOM/plugins/`)
- `submodules/.solarized` — gnome-terminal solarized colors

Clone with: `git clone --recursive`. Update all: `git submodule update --init --recursive`.

## Platform quirks

- `.zshrc` hardcodes `ZSH="/home/lee/.oh-my-zsh"` and `SYNTAX_ZSH="/home/lee/.zsh-syntax-highlighting"` — Linux paths. On macOS or other platforms these paths must be adjusted (stow links them to `~/.oh-my-zsh` and `~/.zsh-syntax-highlighting`).
- `install.sh` hardcodes `apt` package manager. `mac_install.sh` is the brew counterpart.
- Vim `.vimrc` line 536: `let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'` — macOS-specific for YouCompleteMe clangd path.

## Notable config details

- **zsh**: agnoster theme, `prompt_context()` overridden to hide user@host (empty), `prompt_dir()` shows only `%c` (current dir). `Ctrl+U` = backward-kill-line, `Ctrl+G` = kill-whole-line. `FZF_DEFAULT_COMMAND='rg --files --sortr modified'`.
- **vim**: Leader key `\`. `F2` stops highlight. `Ctrl+Tab`/`Ctrl+Shift+Tab` cycle windows. `F11/F12` quickfix navigation. `F9` wildmenu for recent files. `F5` async make via asyncrun. `Tab` runs clang-format. YCM mappings: `\fi` fixit, `\gt` goto, `\gd` goto def, `\gh` goto decl, `\gr` goto refs. `\v` paste-over-selection from `"0` register. Colorscheme: molokai. `.swp`/`.swo`/undodir in gitignore.
- **tmux**: `Alt+arrow` switches panes without prefix. `Prefix+r` reloads config. Splits/new windows inherit current pane path (`-c "#{pane_current_path}"`).
- **git**: Aliases: `st`=status, `lo`=log --oneline, `lg`=pretty log graph, `sneak`=amend-no-edit, `undo`=reset --soft HEAD^.
- **mpv**: GPU-hq profile, ICC auto, interpolation/oversample, HW decode auto-safe, save-position-on-quit, OSC off.

## Before editing

- Run `lsp_diagnostics` after editing `.vimrc`, `.zshrc`, `.tmux.conf`? No LSP available for these — manual validation with `vim -c 'syn on'` or `zsh -n` syntax check.
- Validate `.vimrc`: `vim -c 'qa!'` — exits with 0 if no errors at startup.
- Validate `.zshrc`: `zsh -n ~/.zshrc` — syntax check.
- Validate `.tmux.conf`: `tmux source-file ~/.tmux.conf` — syntax check.
- Stow changes: after modifying a dotfile inside a stow package directory (e.g., `zsh/.zshrc`), run `stow -D zsh -t $HOME && stow zsh -t $HOME` to re-link.
