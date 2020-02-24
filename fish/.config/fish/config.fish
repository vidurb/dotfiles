# Remove shell greeting
set fish_greeting
# force tmux to be 256color and unicode compatible
alias tmux="tmux -u -2"
alias clip='xsel --clipboard --input'

if test -d "$HOME/bin";
    set -x PATH $PATH "$HOME/bin/"
end

if test -d "$HOME/.local/bin";
    set -x PATH $PATH "$HOME/bin"
end
if test -d "$HOME/bin";
    set -x PATH $PATH "$HOME/.local/bin"
end
if test -d "$HOME/.cargo/bin";
    set -x PATH $PATH "$HOME/.cargo/bin"
end
if test -d "$HOME/go/bin";
    set -x PATH $PATH "$HOME/go/bin"
end
if test -d "$HOME/.npm-global/bin";
    set -x PATH $PATH "$HOME/.npm-global/bin"
end
if test -d "$HOME/.config/composer/vendor/bin";
    set -x PATH $PATH "$HOME/.config/composer/vendor/bin"
end
if test -d "$HOME/.composer/vendor/bin";
    set -x PATH $PATH "$HOME/.composer/vendor/bin"
end
# Set default editor
set -gx EDITOR vim
# Use starship theme
eval (starship init fish)
# Check if exa/bat are installed
if type "exa" >/dev/null;
    alias ls="exa --icons"
end
if type "bat" >/dev/null;
    alias cat=bat
end

if functions -q bax
    bax 'eval "$(symfony-autocomplete)"'
end

alias sc="symfony console"

export ANSIBLE_COW_SELECTION=random
export ANSIBLE_NOCOWS=1
export LESSCHARSET=utf-8
