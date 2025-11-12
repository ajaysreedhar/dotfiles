# ~/.bash_profile
# -------------------------------------------------------------
# Common Bash initialization for login and non-login shells.
# 
# This file contains universal setup — PATH, aliases, 
# completions, and helper functions that are relevant to all 
# interactive shells.
#
# This file is sourced directly by login shells.
# For non-login interactive shells (like terminal emulators),
# ~/.bashrc will explicitly source this file.
#
# NOTE: 
# In this setup, ~/.bash_profile is NOT sourcing ~/.bashrc.
# This is intentional to keep terminal-specific styling
# isolated in ~/.bashrc.
# -------------------------------------------------------------

# Set BASH history options.
# -------------------------------------------------------------

# Append to the history file, don't overwrite it.
shopt -s histappend

# Merge multi-line commands into a single history entry.
shopt -s cmdhist

# Settings for in-memory history size and .bash_history file.
HISTSIZE=1000
HISTFILESIZE=5000

# Ignore duplicates and some trivial commands.
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE="ls:ll:cd:pwd:exit:clear"

# User specific binary paths.
# -------------------------------------------------------------
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH

# Declare command aliases that are applicable in both login and
# non-login interactive shells.
# -------------------------------------------------------------
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    
    alias ll='ls --color=auto --time=birth --group-directories-first -Alh'
    alias lk='ls --color=auto --time=birth --group-directories-first -Alh | grep -i'
fi

alias lgrep='ll | grep -i'

if command -v fastfetch &>/dev/null; then
    alias ffetch='fastfetch'
fi


# Enable programmable completion features.
# -------------------------------------------------------------
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# PS1 format for login shell.
# -------------------------------------------------------------
PS1='\[\e[1;32m\][\u@\h]:\[\e[0;36m\][\w]\[\e[0m\]\$ '

