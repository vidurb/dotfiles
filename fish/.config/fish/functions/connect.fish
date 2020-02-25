function connect -d "Connect to servers via ssh"
    argparse --name=connect "h/help" -- $argv
    or return

    if test \( -n "$_flag_h" \) -o \( -n "$_flag_help" \)
        _connect_help >&2
        return 0
    end

    if test -z "$KITTY_WINDOW_ID"
        echo "This utility only works in kitty, sorry."
        return 1
    end

    for server in $argv
        kitty @new-window --tab-title $server --new-tab --keep-focus ssh $server -t "tmux new -A -s vidur"
    end

end

function _connect_help -d "Describe usage of servers command"
    printf '%s\n%s\n' \
    'connect - connect to remote tmux sessions in new kitty tabs' \
    'Usage: connect <arguments> <server names>' 
end
