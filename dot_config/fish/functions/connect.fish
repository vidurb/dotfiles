function connect -d "SSH to standard tmux session"
  ssh $argv -t tmux new -A -s vidur
end