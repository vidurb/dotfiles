# Create or attach to Symfony tmux session
function tmux_symfony --description="Creates/attaches to tmux session for symfony, arg is directory"
    set -l project_path $argv[1]
    set -l session_name (string split -r -m1 '/' $project_path)[2]
    tmux \
    	new-session -AD -t $session_name -c $project_path \; \
    	rename-window symfony \; \
    	split-window -vb -p 25 'symfony server:start' \; \
    	new-window -d -c $project_path -n vim 'vim src' \; \
    	select-pane -D
end