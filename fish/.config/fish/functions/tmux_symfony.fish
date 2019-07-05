# Create or attach to Symfony tmux session
function tmux_symfony --description="Creates/attaches to tmux session for symfony, arg is directory"
    set SESSIONNAME $argv[1]
    tmux has-session -t $SESSIONNAME > /dev/null 2> /dev/null
    if test $status -ne 0  
        tmux new-session -s $SESSIONNAME -n script -d
    end
    tmux attach -t $SESSIONNAME
end