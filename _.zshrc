# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ajay/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# The following lines are manually added.
# Author - Ajay Sreedhar

# Modify command prompt style.
PROMPT="%F{084}[%n]%f%F{147}:%f%F{081}[%5~]%f %F{147}❯%f "

# Use this style for root user.
#PROMPT="%F{red}[%n]%f%F{221}:%f%F{208}[%5~]%f %F{196}❯%f "

# Command alias list.
alias ll='ls --color=auto --time=birth --group-directories-first -Alh'
alias lgrep='ll | grep -i'
alias gedit='gnome-text-editor'
alias ffetch='fastfetch'

# Package manager alias list.
alias flatpax='flatpak --installation=extras'
