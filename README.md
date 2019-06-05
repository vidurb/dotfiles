# Vidur's Dotfiles

This repo includes my 'dot files' (configuration files for most command-line 
and some GUI applications) as well as basic tooling (shell scripts) I have 
written myself to set up my configuration on a new terminal.

I use [Arctic Ice Studio](https://github.com/arcticicestudio)'s excellent Nord 
color scheme wherever possible. I would encourage you to check out their repos 
if you like the look of my tools. (Screenshots are at the bottom)



### Shell scripts

`install.sh` is a script that uses GNU `stow` to symlink the configuration files
in this repository into the correct locations. The locations are defined by the
subfolder path and applied relative to user $HOME.

For example, the Vim config is symlinked into the root of user $HOME because it 
is in the root of the `vim` folder. Similarly, the Neovim configuration is 
symlinked to `$HOME/.config/nvim/init.vim`, because the relative file path of
init.vim inside the `nvim` folder is `/.config/nvim/init.vim`.

The installation scripts uses GNU `stow`s handy capability to automatically 
refresh symlinks, so once the configuration files are installed, updating them
from newer versions of this repository is as simple as running `install.sh`
again.

A recent addition is auto installation of dependencies. This feature depends on
git and curl. I am yet to add a guard for the case where those are missing. 

Currently, dependencies for neovim, vim, zsh, fish and tmux are installed.

`clean.sh` is a utility that will delete existing configuration files so that
they can be replaced using `install.sh`; it is separated from `install.sh` and
confirms each deletion to reduce the chance of an existing configuration not
from this repository being deleted by accident.

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
![My Alacritty and Zsh](https://i.imgur.com/vqBnPli.png)
#### My vim config:
![My Vim](https://i.imgur.com/HhXAe2I.png)

