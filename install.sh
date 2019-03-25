#!/bin/sh

for directory in */;
do 
    read -r -p "Symlink the contents of ${directory%/} into $HOME?" response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            stow --target=$HOME --restow $directory
            echo "Symlinked."
            ;;
        *)
            echo "Ignored."
            ;;
    esac
done
