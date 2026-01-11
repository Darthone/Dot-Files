#! /usr/bin/env fish

# Ensure local user binaries are in PATH for fish sessions
fish_add_path $HOME/.local/bin

alias cdf="cd (find . -type d | fzf)"
