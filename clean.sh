#!/bin/bash

cleanFile() {
    if [[ -h "$HOME/$1" ]]; 
    then
        read -r -p "$HOME/$1 is a symlink to `realpath "$HOME/$1"`, should it be unlinked? [y/N] " response
        case "$response" in
            [yY][eE][sS]|[yY]) 
                unlink $HOME/$1
                echo "Unlinked."
                ;;
            *)
                echo "Ignored."
                ;;
        esac
    elif [[ -f "$HOME/$1" ]];
    then
        read -r -p "$HOME/$1 exists, should it be deleted? [y/N] " response
        case "$response" in
            [yY][eE][sS]|[yY]) 
                rm -f $HOME/$1
                echo "Deleted."
                ;;
            *)
                echo "Ignored."
                ;;
        esac
    fi
}
confirm() {
read -r -p "Are you sure? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        true
        ;;
    *)
        false
        ;;
esac
}

for directory in */;
do
    directory_files=`find -L "${directory}" -type f`;
    cleanFile "${directory_files#*/}";
done 
