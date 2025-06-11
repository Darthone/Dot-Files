
if status is-interactive

end

. $HOME/.alias
. $HOME/.localrc

set fish_greeting ""

export VISUAL=nvim
export EDITOR="$VISUAL"

alias resource="source ~/.config/fish/config.fish"
alias editrc="nvim ~/.config/fish/config.fish"


set -U fish_user_paths $HOME/bin $fish_user_paths


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

starship init fish | source
