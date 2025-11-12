# ~/.bashrc
# -------------------------------------------------------------
# Bash configuration for NON-LOGIN interactive shells only.
#
# This file contains terminal-emulator-specific customizations
# like fancy PS1 prompts, colors, and features that only makes 
# sense inside a visual or interactive terminal.
#
# It sources ~/.bash_profile to ensure that all universal setup
# (aliases, completions) are available in non-login shells too.
# -------------------------------------------------------------

# If not running interactively, don't do anything.
# -------------------------------------------------------------
case $- in
    *i*) ;;
      *) return;;
esac

# Source .bash_profile if available.
# -------------------------------------------------------------
if [ -f "${HOME}/.bash_profile" ]; then
    . "${HOME}/.bash_profile"
fi

# PS1 format for interactive non-login shells.
# Nerd fonts are required to render the symbols correctly.
# -------------------------------------------------------------
declare -A prompt_color
declare -A prompt_crumb

# Initialize last_directory once

prompt_color[host_fg]='\[\e[38;2;200;220;245m\]'
prompt_color[host_bg]='\[\e[48;2;50;62;93m\]'
prompt_color[host_ic]='\[\e[38;2;50;62;93m\]'

prompt_color[dir_fg]='\[\e[38;2;105;160;245m\]'
prompt_color[dir_bg]='\[\e[48;2;33;40;54m\]'
prompt_color[dir_ic]='\[\e[38;2;33;40;54m\]'

prompt_color[time_fg]='\[\e[38;2;158;170;205m\]'
prompt_color[time_bg]='\[\e[48;2;35;45;60m\]'
prompt_color[time_ic]='\[\e[38;2;35;45;60m\]'

prompt_color[alt_fg]='\[\e[38;2;139;203;90m\]'
prompt_color[alt_bg]='\[\e[48;2;36;45;60m\]'
prompt_color[reset]='\[\e[0m\]'

prompt_crumb[host_info]="${prompt_color[host_bg]}${prompt_color[host_fg]} \u@\h ${prompt_color[reset]}${prompt_color[host_ic]}${prompt_color[reset]}"
prompt_crumb[directory]="${prompt_color[dir_ic]}${prompt_color[dir_bg]}${prompt_color[dir_fg]} 🖿 \w ${prompt_color[reset]}${prompt_color[dir_ic]}${prompt_color[reset]}"
prompt_crumb[timestamp]="${prompt_color[time_ic]}${prompt_color[time_bg]}${prompt_color[time_fg]} 󱫑 \A ${prompt_color[reset]}${prompt_color[time_ic]}${prompt_color[reset]}"
prompt_crumb[text_area]="${prompt_color[alt_fg]} ${prompt_color[reset]}"

PS1="${prompt_crumb[host_info]}${prompt_crumb[directory]}${prompt_crumb[timestamp]}\n${prompt_crumb[text_area]}"

unset prompt_color
unset prompt_crumb

# Command line aliases for graphical applications.
# -------------------------------------------------------------
alias gedit='gnome-text-editor'
alias flatpax='flatpak --installation=extras'

