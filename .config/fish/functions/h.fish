# Highlight select keywords in output
# example commands
# echo "abcdefghijklmnopqrstuvxywz" | h  "[F-O]"
# echo "abcdefghijklmnopqrstuvxywz" | h -i "[F-O]"
# echo "abcdefghijklmnopqrstuvxywz" | h -i -n "[f-o]"
# echo "abcdefghijklmnopqrstuvxywz" | h -i -n a b c d E f g h i j k l z
# echo "abcdefghijklmnopqrstuvxywz" | h -n a b c d E f g h i j k l z
# echo "abcdefghijklmnopqrstuvxywz" | h -i a b c d E f g h i j k l z
# echo "abcdefghijklmnopqrstuvxywz" | h a b c d E f g h i j k l z

function h
    if not type -q ack
        echo "Error: 'ack' is required but not found in PATH"
        return 1
    end

    set ignore_case 0
    set invert_colors 0
    set keywords

    # Parse flags
    for arg in $argv
        switch $arg
            case '-i'
                set ignore_case 1
            case '-n'
                set invert_colors 1
            case '*'
                set keywords $keywords $arg
        end
    end

    if test (count $keywords) -eq 0
        echo "Usage: ... | h [-i] [-d] [-n] word1 word2 ..."
        return 1
    end

    set color_opt "bold on_yellow"
    if test $invert_colors -eq 1
        set color_opt "bold black on_white"
    end

    # Build common ack options
    set ack_args "--flush" "--passthru" "--color" "--color-match=$color_opt"
    if test $ignore_case -eq 1
        set ack_args $ack_args "--ignore-case"
    end

    set regex (string join "|" $keywords)
    ack $ack_args "$regex"
end

