#!/bin/bash

echo "This script requires git & curl"

for directory in */;
do 
    if [[ ${directory%/} == nvim ]]; then
        if [[ -e  ~/.local/share/nvim/site/autoload/plug.vim ]]; then
            echo "vim-plug already installed"
        else
            read -r -p "Install vim-plug for nvim?" response
            case "$response" in
                [yY][eE][sS]|[yY]) 
                    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                    echo "vim-plug installed in ~/.local/share/nvim"
                    ;;
                *)
                    echo "vim-plug not installed"
                ;;
            esac
        fi
    fi
    if [[ ${directory%/} == vim ]]; then
        if [[ -e  ~/.local/share/nvim/site/autoload/plug.vim ]]; then
            echo "vim-plug already installed"
        else
            read -r -p "Install vim-plug for vim?" response
            case "$response" in
                [yY][eE][sS]|[yY]) 
                    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                    echo "vim-plug installed in ~/.vim"
                    ;;
                *)
                    echo "vim-plug not installed"
                ;;
            esac
        fi
    fi
    if [[ ${directory%/} == zsh ]]; then
        if [[ -e  ~/.zprezto ]]; then
            echo "prezto already installed"
        else
            read -r -p "Install prezto for zsh?" response
            case "$response" in
                [yY][eE][sS]|[yY]) 
                    git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
                    echo "prezto installed in ~/.zprezto"
                    ;;
                *)
                    echo "prezto not installed"
                ;;
            esac
        fi
    fi
    if [[ ${directory%/} == fish ]]; then
        if [[ -e  ~/.config/fish/functions/fisher.fish ]]; then
            echo "fisher already installed"
        else
            read -r -p "Install fisher for fish?" response
            case "$response" in
                [yY][eE][sS]|[yY]) 
                    git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
                    echo "fisher installed in ~/.config/fish"
                    ;;
                *)
                    echo "fisher not installed"
                ;;
            esac
        fi
    fi
 
    read -r -p "Symlink the contents of ${directory%/} into $HOME?" response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            stow --no-folding --target=$HOME --restow $directory
            echo "Symlinked."
            ;;
        *)
            echo "Ignored."
            ;;
    esac
done
