#!/bin/bash

cleanFile() {
    if [[ -f "$HOME/$1" ]]; 
    then
        echo "$HOME/$1 exists, deleting now"
        rm -f $HOME/$1
    else
        echo "$HOME/$1 does not exist, no need to delete"
    fi
}

for directory in */;
do 
    directory_files=`find "${directory}" -type f`;
    cleanFile "${directory_files#*/}";
done 
