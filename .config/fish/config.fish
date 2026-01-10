
if status is-interactive
    # Start ssh-agent if needed and preload the default key for forwarding.
    if not set -q SSH_AUTH_SOCK; or not test -S "$SSH_AUTH_SOCK"
        eval (ssh-agent -c) >/dev/null
    end
    if test -f ~/.ssh/id_ed25519
        ssh-add -l >/dev/null 2>&1
        if test $status -eq 2
            eval (ssh-agent -c) >/dev/null
        end
        ssh-add -l 2>/dev/null | grep -q "id_ed25519"
        or ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1
    end
end

. $HOME/.alias
. $HOME/.localrc

set fish_greeting ""

export VISUAL=nvim
export EDITOR="$VISUAL"

alias resource="source ~/.config/fish/config.fish"
alias editrc="nvim ~/.config/fish/config.fish"


set -U fish_user_paths $HOME/bin $fish_user_paths
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths


function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

# plugins
# sudo apt install fzf
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# prompt
# vi ~/.config/fish/functions/fish_prompt.fish

#starship init fish | source
