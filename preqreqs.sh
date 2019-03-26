#!/bin/bash

# Add vim-plug
cd 
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Cloned vim-plug!"
# Add oh-my-tmux
git clone https://github.com/samoshkin/tmux-config.git
echo "Cloned oh-my-tmux"
ln -s -f .tmux/.tmux.conf
echo "Linked oh-my-tmux"
# Add tmux-nord theme
git clone https://github.com/arcticicestudio/nord-tmux ~/.tmux/themes/nord-tmux
# Add zsh-nvm
git clone https://github.com/lukechilds/zsh-nvm ~/.zprezto/contrib/zsh-nvm
