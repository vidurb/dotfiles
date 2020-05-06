# Remove shell greeting
set fish_greeting
# force tmux to be 256color and unicode compatible
alias tmux="tmux -u -2"
alias mosh="mosh -p 62713"
alias clip='xsel --clipboard --input'

cat "$__fish_config_dir/bindirs.txt" | read --list -d : __extra_path_dirs

for dir in __extra_path_dirs
    if test -d $dir
        if not contains $dir $PATH
            set PATH $PATH $dir
        end
    end
end

# Set default editor
set -gx EDITOR vim
# Use starship theme
# Check if exa/bat are installed
if status --is-interactive
    abbr --add --global a-g 'ansible-galaxy'
    abbr --add --global a-v 'ansible-vault'
    abbr --add --global gr git reset
    abbr --add --global gl git log
    abbr --add --global gs git status
    abbr --add --global gf git fetch
    abbr --add --global gco git checkout
    abbr --add --global gfap git fetch --all --prune
    abbr --add --global merge-master lab mr create origin master -a vidur -m
    abbr --add --global merge-future lab mr create origin future -a vidur -m
    abbr --add --global merge-develop lab mr create origin develop -a vidur -m
    abbr --add --global sc symfony console
    abbr --add --global d-c docker-compose
    abbr --add --global sbc bin/console
if type -q "exa" ;
    alias ls="exa --icons"
end
if type -q "bat";
    alias cat=bat
end
if type -q "aws";
    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
end
if functions -q bax
    bax 'eval "$(symfony-autocomplete)"'
end
if type -q "code-insiders";
    if not type -q "code";
        alias code=code-insiders
    end
end
end

# Set nord theme
set -U fish_color_normal normal
set -U fish_color_command 81a1c1
set -U fish_color_quote a3be8c
set -U fish_color_redirection b48ead
set -U fish_color_end 88c0d0
set -U fish_color_error ebcb8b
set -U fish_color_param eceff4
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 4c566a
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan

export ANSIBLE_COW_SELECTION=random
export ANSIBLE_NOCOWS=1
export LESSCHARSET=utf-8
# Starship!
starship init fish | source
