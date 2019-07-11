# Create or attach to Symfony tmux session
function tmux_symfony --description="Creates/attaches to tmux session for symfony, arg is directory"
    set -l project_path $argv[1]
    set -l session_name (string split -r -m1 '/' $project_path)[2]
    if test $project_path = '/home/vidur/Sources/astra-dash'
        set server_command 'symfony proxy:start && symfony server:start --port=8002 --allow-http'
    else 
        set server_command 'symfony proxy:start && symfony server:start'
    end
    tmux \
    	new-session -AD -t $session_name -c $project_path \; \
    	rename-window symfony \; \
        split-window -vb -p 25 $server_command \; \
    	select-pane -D
end
