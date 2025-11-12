# ZSH configuration
# Generated on 2025-06-08

# Use vi keybindings
bindkey -v

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
zstyle :compinstall filename '/home/ajay/.zshrc'
autoload -Uz compinit
compinit

# The following lines are manually added.
# Author - Ajay Sreedhar

# Modify command prompt style.
PROMPT="%F{084}[%n]%f%F{147}:%f%F{081}[%5~]%f %F{147}❯%f "

# Command alias list.
alias ll='ls --color=auto --time=birth --group-directories-first -Alh'
alias lgrep='ll | grep -i'
alias gedit='gnome-text-editor'
alias ffetch='fastfetch'

# Package manager alias list.
alias flatpax='flatpak --installation=extras'
alias pwy='printf %s "$(pwd)" | wl-copy'

