# Remove shell greeting
set fish_greeting
# force tmux to be 256color and unicode compatible
alias tmux="tmux -u -2"
# Add to path from .profile
bass source ~/.profile
# Set default editor
set -gx EDITOR vim
