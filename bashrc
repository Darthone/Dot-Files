# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1
HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export PS1="\[\e[38;5;124m\]\t\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[38;5;118m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[38;5;166m\]\H\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[38;5;27m\]\w\[\e[0m\]\[\e[00;37m\] \\$ \[\e[0m\]"



# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

export TERM=screen-256color
alias editrc="vi ~/.bashrc"
alias ssa="eval $(ssh-agent)"

mkcd() {
    mkdir -p "$1" && cd "$1"
}


gri() {
    grep -ir "$*"
}

gr() {
    grep -r "$*"
}

source ~/.alias
source ~/.localrc


# home brew install
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=$PATH:/home/linuxbrew/.linuxbrew/opt/:/home/linuxbrew/.linuxbrew/bin/

