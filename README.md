My configuration files and stuffs.
---

# How to use?
## Apply all of configurations and stuffs
```bash
./install.sh
```

#todo <<zof>>
#todo <<zof>>
## Extra setting
1. Check the TerminatorThemes option under terminator -> preferences -> plugins.
2. Open the terminator context menu and select Themes.
3. Select the favorite theme and click install.
4. Set the favorite theme as default by modifing `.confg/terminator/confg` or UI of `Perference -> Layout`.
5. Reuse the defualt profile for all new terminals by `preference -> global` and check `Re-user profiles for new terminals` option.
```
# Maybe this is not neccessary after I copy configuration files
#1. When finished to install `zsh`, restart the terminal.
#2. You should see the configuration menu of zsh and choose option 2: 
#```bash
#(2)Populate your ~/.zshrc with the configuration recommended by the system administrator and exit
#```
```
6. Preferences -> Profiles -> Colors -> Foreground and Background -> Built-in schemes: Solarized dark
7. Preferences -> Profiles -> Colors -> Palette -> Built-in schemes: Solarized

## Now?
Now? Enjoy my linux enviroment.

# The configuration files and stuffs
> Just some details.
## .vim
My vimrc and vim-plugin.

## .gitconfig

## .zshrc

## Terminator
### Themes
I used [Eliverlara/terminator](https://github.com/EliverLara/terminator-themes) as my base of terminator theme.

1. Check the TerminatorThemes option under terminator -> preferences -> plugins.
2. Open the terminator context menu and select Themes.
3. Select the favorite theme and click install.
4. Set the favorite theme as default by modifing `.confg/terminator/confg` or UI of `Perference -> Layout`.
5. Reuse the defualt profile for all new terminals by `preference -> global` and check `Re-user profiles for new terminals` option.

## Zsh
1. When finished to install `zsh`, restart the terminal.
2. You should see the configuration menu of zsh and choose option 2: 
```bash
(2)Populate your ~/.zshrc with the configuration recommended by the system administrator and exit
```

## Oh My Zsh
[Oh my zsh](https://github.com/ohmyzsh/ohmyzsh.git) is a framework for managing my zsh. It adds a lot of helper functions, plugins, themes.
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Powerline fonts
We need these fonts to show Unicode chars in the terminal.
```bash
sudo apt-get install fonts-powerline
```

# Change theme to Agnoster
Need to change `ZSH_THEME="robbyrussell"` to `ZSH_THEME="agnoster"` in .zshrc.

## Solarized color
Install the color palette for the terminal.
```bash
git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.solarized
cd ~/.solarized && ./install.sh
# Choose dark theme and downlod dircolors-solarized.
```
After installation, add the following in .zshrc.
```bash
eval `dircolors ~/.dir_colors/dircolors`
```
Setting:
1. Preferences -> Profiles -> Colors -> Foreground and Background -> Built-in schemes: Solarized dark
2. Preferences -> Profiles -> Colors -> Palette -> Built-in schemes: Solarized

## Autosuggestions
I use [ash-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
Add `plugins=(zsh-autosuggestions)` in .zshrc to let My Zsh to load this plugin. <kbd>→</kbd> or <kbd>End</kbd> to use the suggestion.

## Only username and current directory
```bash
# Only display username
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi  
}
# Only display current directory
prompt_dir() {
    prompt_segment blue black '%c'
}
```

## Syntax highlighting
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```


