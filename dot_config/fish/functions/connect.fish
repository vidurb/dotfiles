function connect -d "SSH/Mosh to standard tmux session"
    ssh $argv -t tmux -u -2 new -A -s vidur
end
