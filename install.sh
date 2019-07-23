#!/usr/bin/env bash

is_app_installed() {
  type "$1" &>/dev/null
}

if ! is_app_installed stow; then
    echo "Stow is not installed - script is exiting"
    exit 1
fi

if ! is_app_installed git; then
    echo "Git is not installed - installation of plugins will fail"
fi

if ! is_app_installed curl; then
    echo "Curl is not installed - installation of some plugins will fail"
fi

for directory in */;
do
    if ! is_app_installed ${directory%/}; then
        printf "${directory%/} not installed - ignoring ${directory%/} config \n"
        continue
    fi
    case "${directory%/}" in
        fish)
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
            ;;
        nvim)
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
            ;;
        tmux)
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
            if [[ -e  ~/.tmux/ ]]; then
                echo "tmux addons already installed"
            else
                read -r -p "Install tpm for tmux?" response
                case "$response" in
                    [yY][eE][sS]|[yY])
                        mkdir -p ~/.tmux/plugins
                        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
                        printf "Install TPM plugins\n"
                        tmux new -d -s __noop >/dev/null 2>&1 || true 
                        tmux set-environment -g TMUX_PLUGIN_MANAGER_PATH "~/.tmux/plugins"
                        "$HOME"/.tmux/plugins/tpm/bin/install_plugins || true
                        tmux kill-session -t __noop >/dev/null 2>&1 || true
                        echo "tpm and plugins installed"
                        ;;
                    *)
                        echo "tmux addons not installed"
                        ;;
                esac
            fi
            ;;
        vim)
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
            ;;
        zsh)
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
            if [[ -e  ~/.zprezto ]]; then
                echo "prezto already installed"
            else
                read -r -p "Install prezto for zsh?" response
                case "$response" in
                    [yY][eE][sS]|[yY]) 
                        git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
                        git clone --recurse-submodules https://github.com/belak/prezto-contrib ~/.zprezto/contrib
                        git clone https://github.com/lukechilds/zsh-nvm ~/.zprezto/contrib/zsh-nvm
                        echo "prezto installed in ~/.zprezto"
                    ;;
                    *)
                        echo "prezto not installed"
                    ;;
                esac
            fi
            ;;
        git)
            if ! is_app_installed diff-so-fancy; then
            read -r -p "Install diff-so-fancy? npm is required" response
            case "$response" in
                [yY][eE][sS]|[yY]) 
                    npm install -g diff-so-fancy   
                    ;;
                *)
                    echo "Ignored."
                    ;;
                esac
            else
                echo "diff-so-fancy already installed"
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
            ;;
        *)
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
            ;;
        esac
done
