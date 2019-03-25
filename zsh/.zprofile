#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
# Add Rust tools
export PATH="$HOME/.cargo/bin:$PATH"
# use exa for ls
alias ls=exa
# Add dasht to path
export PATH="$HOME/dasht-2.3.0/bin:$PATH"
export MANPATH="$HOME/dasht-2.3.0/man:$MANPATH"
# this was for symbols in tmux
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
# Chromium Beta envvars
export GOOGLE_API_KEY="AIzaSyAFCLypHm8zkYboGS9JMZow21tf-xz6JF8"
export GOOGLE_DEFAULT_CLIENT_ID="2036720488-fbeu3aqqhkphbsoafveaojlmh7g07s4m.apps.googleusercontent.com"
export GOOGLE_DEFAULT_CLIENT_SECRET="LHPMKigO7PUweDavK1zbYPOX"

# Ubuntu make installation of Ubuntu Make binary symlink
PATH=/home/vidur/.local/share/umake/bin:$PATH

