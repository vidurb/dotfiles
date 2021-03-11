function connect -d "SSH/Mosh to standard tmux session"
  if type -q "mosh"
    mosh --ssh="$argv -t tmux -u -2 new -A -s vidur"
  else
    ssh $argv -t tmux -u -2 new -A -s vidur
  end
end
