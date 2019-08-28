# Vidur's Dotfiles

##  It is a mistake to think you can solve any major problems just with potatoes.

This repo includes my 'dot files' (configuration files for most command-line 
and some GUI applications) as well as basic tooling (shell scripts) I have 
written myself to set up my configuration on a new terminal.

I use [Arctic Ice Studio](https://github.com/arcticicestudio)'s excellent Nord 
color scheme wherever possible. I would encourage you to check out their repos 
if you like the look of my tools. (Screenshots are at the bottom)

### Making local changes

If you want to change the contents of one of the configuration files locally, but don't
want to fork this repo/submit a merge request/etc., you can use this handy command to tell
git to ignore a particular folder:

`git update-index --skip-worktree <path-name>`

or a particular file:

`git update-index --assume-unchanged [path]`

### Shell scripts

New and improved: `install.sh` now has proper command line options and arguments.
Features include turning off user interaction, automatically deleting existing files,
automatically installing dependencies (for the configurations), and a couple more.
Please see the command help below.

```
Welcome to Vidur's Dotfiles. This utility relies on GNU stow, git and curl
Usage: ./install.sh [-t|--target-dir <arg>] [-c|--(no-)clear] [-q|--(no-)quiet] [-n|--(no-)no-interaction] [-i|--(no-)install-deps] [-v|--(no-)verbose] [-l|--list] [-h|--help] [--] [<config-1>] ... [<config-n>] ...
        <config>: Configuration to install - defaults to all
        -t, --target-dir: Target directory to symlink configs into (defaults to /home/vidur) (no default)
        -c, --clear, --no-clear: Remove existing files without user intervention (off by default)
        -q, --quiet, --no-quiet: Do not print error and status messages (off by default)
        -n, --no-interaction, --no-no-interaction: Do not ask for user confirmation for anything (off by default)
        -i, --install-deps, --no-install-deps: Do not ask for user confirmation to install dependencies (off by default)
        -v, --verbose, --no-verbose: Print details status messages (off by default)
        -l, --list: List all available configurations
        -h, --help: Prints help
```

The main function of `install.sh` remains to symlink configuration files into their
respective places using GNU stow. 

For example, the Vim config is symlinked into the root of user $HOME because it is in the root of the vim folder. Similarly, the Neovim configuration is symlinked to $HOME/.config/nvim/init.vim, because the relative file path of init.vim inside the nvim folder is /.config/nvim/init.vim.

A new feature is that the target directory can now be set at runtime - it defaults to $HOME.

Note that the dependencies still all install to $HOME - this is an oversight that will be fixed shortly.

### Repo Prerequisites
The installation script requires [GNU stow](https://www.gnu.org/software/stow/) 
to execute, as well as git & curl to download dependencies.

If you encounter conflicts, the most likely cause is that some of the 
configuration files you're trying to install already exist. We're using GNU stow 
to symlink files into the correct places from this repository, rather than 
copying files to the defined locations. You can use `clean.sh` to delete your
old configuration files, or if you wish to keep your configuration/merge it with
mine, you can fork this repo and add your own configurations before running
`clean.sh` and `install.sh`.


### Configs


##### alacritty
Alacritty is my preferred terminal. This config is doesn't diverge much from the
default config except for the usage of the Nord theme, but I anticipate that
will change.

##### git
My basic git config - unlikely to be useful for anyone else

##### mercurial (hg)
My basic mercurial config - unlikely to be useful for anyone else

##### neovim
The Vim & Nvim configuration requires a vim plugin manager. The configuration is 
written for [vim-plug](https://github.com/junegunn/vim-plug), but changing it to
use another package manager is trivial.

##### sh
Just some bits I didn't want to lose track of when I reinstall my OS.
If you use ubuntu-make, it will be added to $PATH in .profile. 
The same goes for Rust/Cargo. There's also a line to source Chromium API keys,
which you can put in ~/.chromium-api-keys

##### tmux
Just a clone of [tmux-config](https://github.com/samoshkin/tmux-config) for now,
with the addition of the [nord-tmux](https://github.com/arcticicestudio/nord-tmux) theme.

##### vim
Vim's configuration is symlinked to the Neovim configuration as I use the same
configuration for both - see that heading for more.

##### zsh
My Zsh config depends on [prezto](https://github.com/sorin-ionescu/prezto), and includes
[prezto-contrib](https://github.com/belak/prezto-contrib) and
[zsh-nvm](https://github.com/lukechilds/zsh-nvm).

##### fish
I recently decided to try out fish (friendly interactive shell). The config depends
on [fisher](https://github.com/jorgebucaran/fisher). 


### Screenshots
#### My terminal and shell:
![My Alacritty and Zsh](https://i.imgur.com/yKXMMkL.png)
#### My vim config:
![My Vim](https://i.imgur.com/6Gmr2IO.png)
#### tmux
![My tmux](https://i.imgur.com/1jlNJBu.png)

