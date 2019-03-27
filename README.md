# Vidur's Dotfiles

This repo includes my 'dot files' (configuration files for most command-line 
and some GUI applications) as well as basic tooling (shell scripts) I have 
written myself to set up my configuration on a new terminal.

I use [Arctic Ice Studio](https://github.com/arcticicestudio)'s excellent Nord 
color scheme wherever possible. I would encourage you to check out their repos 
if you like the look of my tools. 


My terminal and shell:
![My Alacritty and Zsh](https://i.imgur.com/vqBnPli.png)


My vim config:
![My Vim](https://i.imgur.com/HhXAe2I.png)

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

`clean.sh` is a utility that will delete existing configuration files so that
they can be replaced using `install.sh`; it is separated from `install.sh` and
confirms each deletion to reduce the chance of an existing configuration not
from this repository being deleted by accident.

`prereqs.sh` is a script that installs the prerequisites for the configurations;
i.e. a plugin manager for vim, the prezto configuration framework for zsh, etc.
Comments in `prereqs.sh` describe everything being installed.

### Repo Prerequisites
The installation script requires [GNU stow](https://www.gnu.org/software/stow/) 
to execute.

If you encounter conflicts, the most likely cause is that some of the 
configuration files you're trying to install already exist. We're using GNU stow 
to symlink files into the correct places from this repository, rather than 
copying files to the defined locations. You can use `clean.sh` to delete your
old configuration files, or if you wish to keep your configuration/merge it with
mine, feel free to fork this repo and add your own configurations before running
`clean.sh` and `install.sh`.


### Config Prerequisites


##### Vim
The Vim & Nvim configuration requires a vim plugin manager. The configuration is 
written for [vim-plug](https://github.com/junegunn/vim-plug), but changing it to
use another package manager is trivial.

##### Zsh
My Zsh config depends on [Prezto](https://github.com/sorin-ionescu/prezto).

### Usage
`clean.sh` deletes/unlinks the installed configuration files, whether they be
outside of the scope of this repository or symlinks to this repository created
by `stow`. It confirms each deletion/unlinking to ensure you don't accidentally
delete your main configuration file.

`install.sh` symlinks the configuration files to their expected locations. It
currently confirms each installation, once I add more command-line arguments to
my scripting repertoire I will add a flag to disable confirmation.
