# Vidur's Dotfiles
##### This is Vidur Butalia's dotfile collection

This repo includes my 'dot files' (configuration files for most command-line 
and some GUI applications) as well as basic tooling (shell scripts) I have 
written myself to set up my configuration on a new terminal.

I use [Arctic Ice Studio](https://github.com/arcticicestudio)'s excellent Nord 
color scheme wherever possible. 
I would encourage you to check out their repos if you like the look of my 
tools.

### Prerequisites
The installation script requires [GNU stow](https://www.gnu.org/software/stow/) 
to execute.

If you encounter conflicts, the most likely cause is that some of the 
configuration files you're trying to install already exist. We're using GNU stow 
to symlink files into the correct places from this repository, rather than 
copying files to the defined locations.

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
