function exit
    if test -n "$TMUX"
        tmux detach
    else
        builtin exit $argv
    end
end