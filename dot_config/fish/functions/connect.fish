function connect -d "SSH to standard tmux session"
  ssh $argv -t tmux -u -2 new -A -s vidur
end
