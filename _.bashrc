# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Setting prompts
# --------- Define Colors (256-color) ----------
declare -A prompt_color
declare -A prompt_crumb

# Initialize last_directory once

prompt_color[host_fg]="\[\e[38;2;124;178;254m\]"
prompt_color[host_bg]="\[\e[48;2;45;55;85m\]"
prompt_color[host_ic]="\[\e[38;2;45;55;85m\]"

prompt_color[dir_fg]="\[\e[38;2;156;170;205m\]"
prompt_color[dir_bg]="\[\e[48;2;33;40;54m\]" # 32=blue;
prompt_color[dir_ic]="\[\e[38;2;33;40;54m\]"

prompt_color[alt_bg]="\[\e[48;2;36;45;60m\]"
prompt_color[reset]="\[\e[0m\]"

prompt_crumb[host_info]="${prompt_color[host_bg]}${prompt_color[host_fg]} \u@\h ${prompt_color[reset]}${prompt_color[host_ic]}${prompt_color[reset]}"
prompt_crumb[directory]="${prompt_color[dir_ic]}${prompt_color[reset]}${prompt_color[dir_bg]}${prompt_color[dir_fg]} 🖿 \w ${prompt_color[reset]}${prompt_color[dir_ic]}${prompt_color[reset]}"
prompt_crumb[timestamp]="${prompt_color[dir_ic]}${prompt_color[reset]}${prompt_color[alt_bg]}${prompt_color[host_fg]} 󱫑 \A ${prompt_color[reset]}${prompt_color[dir_ic]}${prompt_color[reset]}"

PS1="${prompt_crumb[host_info]}${prompt_crumb[directory]}${prompt_crumb[timestamp]}\n "

unset prompt_color
unset prompt_crumb

# Declare command aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    
    alias ll='ls --color=auto --time=birth --group-directories-first -Alh'
    alias lk='ls --color=auto --time=birth --group-directories-first -Alh | grep -i'
fi

alias gedit='gnome-text-editor'
alias flatpax='flatpak --installation=extras'

if command -v fastfetch &>/dev/null; then
    alias ffetch='fastfetch'
fi

