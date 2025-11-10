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

prompt_color[host_fg]="\[\e[38;5;15m\]"
prompt_color[host_bg]="\[\e[48;5;30m\]"
prompt_color[host_ic]="\[\e[38;5;30m\]"

prompt_color[dir_fg]="\[\e[38;5;15m\]"
prompt_color[dir_bg]="\[\e[48;5;32m\]"
prompt_color[dir_ic]="\[\e[38;5;32m\]"

prompt_color[text_fg]="\[\e[38;5;43m\]"
prompt_color[reset]="\[\e[0m\]"

prompt_crumb[host_info]="${prompt_color[host_bg]}${prompt_color[host_fg]} 🖳 \u@\h ${prompt_color[reset]}${prompt_color[host_ic]}${prompt_color[reset]}"
prompt_crumb[directory]="${prompt_color[dir_ic]}${prompt_color[reset]}${prompt_color[dir_bg]}${prompt_color[dir_fg]} 🖿 \w ${prompt_color[reset]}${prompt_color[dir_ic]}${prompt_color[reset]}"

PS1="${prompt_crumb[host_info]}${prompt_crumb[directory]}\n\$ "

