function exit
    if test -n "$TMUX"
        tmux detach
        commandline -f repaint
    else
        builtin exit $argv
    end
end