# Directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# some more ls aliases
alias ll='ls -alF --human-readable'
alias la='ls -al --human-readable'
alias l='ls -alF --human-readable'
alias s='cd ..'

export GREP_OPTIONS='--color=auto'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export PS1="\[\e[38;5;124m\]\t\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[38;5;118m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[38;5;166m\]\H\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[38;5;27m\]\w\[\e[0m\]\[\e[00;37m\] \\$ \[\e[0m\]"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

eval "$(dircolors ~/.dir_colors)"
export TERM=screen-256color
