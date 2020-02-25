function serve -d "Serve a web project(PHP/JS)"

    argparse --name=serve "h/help" "s/session=" "r/root=" -- $argv 

    set -g _serve_session_name 'servers'
    set -g _serve_root "$HOME/src"
    set -la _serve_projects

    if test \( -n "$_flag_h" \) -o \( -n "$_flag_help" \)
        _serve_help >&2
        return 0
    end

    if test \( -n "$_flag_s" \) -o \( -n "$_flag_session" \)
        set -l _serve_session_name $_flag_s
    end

    if test \( -n "$_flag_r" \) -o \( -n "$_root" \)
        set -l _serve_root $_flag_r
    end

    _serve_tmux $_serve_session_name

    for project_name in $argv
        _serve_project $project_name
    end

    tmux attach -t $_serve_session_name
end

function _serve_project

    set -l _serve_project_dir (find "$_serve_root" -type d -path "*/$argv" ! -path . -print -quit )
    if test ! -d "$_serve_project_dir"
        echo "Could not find project $argv in $_serve_root"
        return 1
    end

    tmux new-window -t $_serve_session_name -n $argv "cd $_serve_dir && $SHELL"

    if test -f "$_serve_project_dir/composer.json"
        tmux split-window -t $argv -vb -p 40 "cd $_serve_project_dir && symfony proxy:start && symfony server:start"
    end

    if test -f "$_serve_project_dir/yarn.lock"
        tmux split-window -t $argv -vb -p 40 "cd $_serve_project_dir && yarn watch"
    end

end

function _serve_help -d 'describe usage of serve command'
    printf '%s\n%s\n%s\n%s\n' \
        'serve - open new tmux windows for your projects' \
        'Usage: serve <arguments> <project names>' \
        'Arguments: s/session - session name' \
        '           r/root - set path to search for projects'
end

function _serve_tmux -d 'start a new tmux session with name passed'
    if tmux has -t $argv
        echo "Existing tmux session $argv found"
    else
        tmux new -d -s $argv
    end
end
