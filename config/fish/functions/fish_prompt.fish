function fish_prompt
    set -l color_cwd
    set -l suffix
    switch $USER
    case root
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        else 
            set color_cwd $fish_color_cwd
        end
        set suffix '#'
    case '*'
        set color_cwd $fish_color_cwd
        set suffix '>'
    end

    set -l last_status $status
    set -l stat

    if test $last_status -ne 0
        set stat (set_color red)"[$last_status]"(set_color normal)
    end

    set -l branch (git branch 2>/dev/null | sed -n '/\* /s///p')

    echo -n -s (date +%H:%M:%S) " " (set_color $color_cwd) (prompt_pwd) (set_color cyan) " $branch" (set_color normal) "$stat $suffix "

end

