#!/usr/bin/env bash

#
# Section: Description
#

## Dotfiles installation script
## by Vidur Butalia
## git:gitlab.com/vidurb/dotfiles
## Dependencies: 
## - GNU stow : required for all functionality
## - git : required for installation of config dependencies (how'd you get this if not git?)
## - curl : required for installation of config dependencies
## - npm : required for installation of a single config dependency
## Thanks, and please submit feedback if you encounter issues or have suggestions.

#
# Section: Bash configuration variables
#

# Exit on error
set -o errexit

# Exit on errors inside functions
set -o errtrace

# Block use of undefined vars
set -o nounset

# Block nullglob from being returned
shopt -s nullglob

#
# Section: Utility functions

# Arguments: Error message, error code
die()
{
	  local _ret=$2
	  test -n "$_ret" || _ret=1
	  test "$_PRINT_HELP" = yes && print_help >&2
	  echo "$1" >&2
	  exit ${_ret}
}

# No arguments
begins_with_short_option()
{
	  local first_option all_short_options='tfqnivlh'
	  first_option="${1:0:1}"
	  test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# No arguments
print_help()
{
	printf '%s\n' "Welcome to Vidur's Dotfiles. This utility relies on GNU stow, git and curl"
	printf 'Usage: %s [-t|--target-dir <arg>] [-c|--(no-)clear] [-q|--(no-)quiet] [-n|--(no-)no-interaction] [-i|--(no-)install-deps] [-v|--(no-)verbose] [-l|--list] [-h|--help] [--] [<config-1>] ... [<config-n>] ...\n' "$0"
	printf '\t%s\n' "<config>: Configuration to install - defaults to all"
	printf '\t%s\n' "-t, --target-dir: Target directory to symlink configs into (defaults to $HOME) (no default)"
	printf '\t%s\n' "-c, --clear, --no-clear: Remove existing files without user intervention (off by default)"
	printf '\t%s\n' "-q, --quiet, --no-quiet: Do not print error and status messages (off by default)"
	printf '\t%s\n' "-n, --no-interaction, --no-no-interaction: Do not ask for user confirmation for anything (off by default)"
	printf '\t%s\n' "-i, --install-deps, --no-install-deps: Do not ask for user confirmation to install dependencies (off by default)"
	printf '\t%s\n' "-v, --verbose, --no-verbose: Print details status messages (off by default)"
	printf '\t%s\n' "-l, --list: List all available configurations"
	printf '\t%s\n' "-h, --help: Prints help"
}

# Argument: name of console command
is_app_installed() {
    type "$1" &>/dev/null
}

# No arguments
install_zsh_deps() {
    git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
    git clone --recurse-submodules https://github.com/belak/prezto-contrib ~/.zprezto/contrib
    git clone https://github.com/lukechilds/zsh-nvm ~/.zprezto/contrib/zsh-nvm
}

# No arguments
install_tmux_deps() {
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    info "Installing TPM plugins\n"
    tmux new -d -s __noop >/dev/null 2>&1 || true 
    tmux set-environment -g TMUX_PLUGIN_MANAGER_PATH "~/.tmux/plugins"
    "$HOME"/.tmux/plugins/tpm/bin/install_plugins || true
    tmux kill-session -t __noop >/dev/null 2>&1 || true
}

# Thanks to bash3boilerplate:
# Arguments: log level, log message
function __b3bp_log () {
  local log_level="${1}"
  shift

  # shellcheck disable=SC2034
  local color_debug="\\x1b[35m"
  # shellcheck disable=SC2034
  local color_info="\\x1b[32m"
  # shellcheck disable=SC2034
  local color_notice="\\x1b[34m"
  # shellcheck disable=SC2034
  local color_warning="\\x1b[33m"
  # shellcheck disable=SC2034
  local color_error="\\x1b[31m"
  # shellcheck disable=SC2034
  local color_critical="\\x1b[1;31m"
  # shellcheck disable=SC2034
  local color_alert="\\x1b[1;33;41m"
  # shellcheck disable=SC2034
  local color_emergency="\\x1b[1;4;5;33;41m"

  local colorvar="color_${log_level}"

  local color="${!colorvar:-${color_error}}"
  local color_reset="\\x1b[0m"

  if [[ "${NO_COLOR:-}" = "true" ]] || ( [[ "${TERM:-}" != "xterm"* ]] && [[ "${TERM:-}" != "screen"* ]] ) || [[ ! -t 2 ]]; then
    if [[ "${NO_COLOR:-}" != "false" ]]; then
      # Don't use colors on pipes or non-recognized terminals
      color=""; color_reset=""
    fi
  fi

  # all remaining arguments are to be printed
  local log_line=""

  while IFS=$'\n' read -r log_line; do
    echo -e "${color}$(printf "[%9s]" "${log_level}")${color_reset} ${log_line}" 1>&2
  done <<< "${@:-}"
}

# Helper functions for logging:

function emergency () {                                __b3bp_log emergency "${@}"; exit 1; }
function alert ()     { [[ "${LOG_LEVEL:-0}" -ge 1 ]] && __b3bp_log alert "${@}"; true; }
function critical ()  { [[ "${LOG_LEVEL:-0}" -ge 2 ]] && __b3bp_log critical "${@}"; true; }
function error ()     { [[ "${LOG_LEVEL:-0}" -ge 3 ]] && __b3bp_log error "${@}"; true; }
function warning ()   { [[ "${LOG_LEVEL:-0}" -ge 4 ]] && __b3bp_log warning "${@}"; true; }
function notice ()    { [[ "${LOG_LEVEL:-0}" -ge 5 ]] && __b3bp_log notice "${@}"; true; }
function info ()      { [[ "${LOG_LEVEL:-0}" -ge 6 ]] && __b3bp_log info "${@}"; true; }
function debug ()     { [[ "${LOG_LEVEL:-0}" -ge 7 ]] && __b3bp_log debug "${@}"; true; }

# Argument: string to prompt
confirm() {

    if [[ "$_arg_no_interaction" == "on" ]]; then
        return 0
    fi

    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# Argument: config to install dependencies for
install_deps() {
        case $1 in
        fish|fish/)
            if [[ ! -e  ~/.config/fish/functions/fisher.fish ]]; then
                if [[ $_arg_no_interaction == on ]] && [[ $_arg_install_deps == on ]]; then
                    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
                    info "fisher installed in ~/.config/fish"
                    break
                fi
                if confirm "Install fisher for fish?" ; then
                    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
                    info "fisher installed in ~/.config/fish"
                else
                    info "fisher not installed"
                fi
            fi
            ;;
        nvim|nvim/)
            if [[ ! -e  ~/.local/share/nvim/site/autoload/plug.vim ]]; then
                if [[ $_arg_no_interaction == on ]] && [[ $_arg_install_deps == on ]]; then
                    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                    info "vim-plug installed in ~/.local/share/nvim"
                    break
                fi
                if confirm "Install vim-plug for nvim?"; then
                    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                    info "vim-plug installed in ~/.local/share/nvim"
                else
                    "vim-plug for nvim not installed"
                fi
            fi
            ;;
        vim|vim/)
            if [[ ! -e  ~/.vim/autoload/plug.vim ]]; then
                if [[ $_arg_no_interaction == on ]] && [[ $_arg_install_deps == on ]]; then
                    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                    info "vim-plug installed in ~/.vim"
                    break
                fi
                if confirm "Install vim-plug for vim?"; then
                    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                    info "vim-plug installed in ~/.vim"
                else
                    info "vim-plug for vim not installed"
                fi
            fi
            ;;
        git|git/)
            if ! is_app_installed diff-so-fancy; then
                if [[ $_arg_no_interaction == on ]] && [[ $_arg_install_deps == on ]]; then
                    npm install -g diff-so-fancy
                    info "diff-so-fancy installed"
                    break
                fi
                if confirm "Install diff-so-fancy? npm is required"; then
                    npm install -g diff-so-fancy
                    info "diff-so-fancy installed"
                else
                    info "diff-so-fancy not installed"
                fi
            fi
            ;;
        emacs|emacs/)
            if [[ ! -e ~/.emacs.d ]]; then
                if [[ $_arg_no_interaction == on ]] && [[ $_arg_install_deps == on ]]; then
                    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
                    info "Spacemacs installed in ~/.emacs.d"
                    break
                fi
                if confirm "Install spacemacs?"; then
                    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
                    info "Spacemacs installed in ~/.emacs.d"
                else
                    info "Spacemacs not installed"
                fi
            fi
            ;;
        zsh|zsh/)
            if [[ ! -e ~/.zprezto ]]; then
                if [[ $_arg_no_interaction == on ]] && [[ $_arg_install_deps == on ]]; then
                    install_zsh_deps
                    info "Zsh plugins installed in ~/.zprezto"
                    break
                fi
                if confirm "Install zprezto, zprezto-contrib and zsh-nvm?"; then
                    install_zsh_deps
                    info "Zsh plugins installed in ~/.zprezto"
                else
                    info "Zsh plugins not installed"
                fi
            fi
            ;;
        tmux|tmux/)
            if [[ ! -e ~/.tmux ]]; then
                if [[ $_arg_no_interaction == on ]] && [[ $_arg_install_deps == on ]]; then
                    install_tmux_deps
                    info "TPM and tmux plugins installed in ~/.tmux"
                    break
                fi
                if confirm "Install tpm and plugins?"; then
                    install_tmux_deps
                    info "TPM and tmux plugins installed in ~/.tmux"
                else
                    info "Tmux plugins not installed"
                fi
            fi
            ;;
    	kitty|kitty/)
	    if [[ ! -e ~/.config/kitty/nord.conf ]]; then
		if confirm "Install nord-kitty theme?"; then
	        curl -o ~/.config/kitty/nord.conf https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf
		info "nord-kitty theme installed"
	    	fi
	    fi
	    ;;
    	*)
            info "No dependencies necessary for ${1%/}"
            ;;
        esac
}

# Argument: config to delete files for
remove_existing_config() {
    local directory_files=`find -L $1 -type f`
    for file in "${directory_files[@]}"; do
        file=${file#*/}
        if  [[ "${_arg_no_interaction}" == on ]]; then
            if [[ -e ${_arg_target_dir}/${file} ]]; then
                rm "${_arg_target_dir}/${file}"
                info "Removing ${_arg_target_dir}/${file}"
            fi
        else
            if [[ -h ${_arg_target_dir}/${file} ]]; then
                if confirm "Unlink symlink ${_arg_target_dir}/${file}?"; then
                    unlink "${_arg_target_dir}/${file}"
                    info "Unlinked ${_arg_target_dir}/${file}"
                fi
            elif [[ -f ${_arg_target_dir}/${file} ]]; then
                if confirm "Remove file ${_arg_target_dir}/${file}?"; then
                    rm "${_arg_target_dir}/${file}"
                    info "Removed ${_arg_target_dir}/${file}"
                fi
            fi
        fi
    done
}
# No arguments
list_configs() {
    local configs=(*/)
    info "Available configs: ${configs[@]}"
}

#
# Section: Global variables
#

# [argbash] THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_config=()
# [argbash] THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_target_dir=
_arg_clear="off"
_arg_quiet="off"
_arg_no_interaction="off"
_arg_install_deps="off"
_arg_verbose="off"

# Environment variables

LOG_LEVEL="${LOG_LEVEL:-6}" # 7 = debug -> 0 = emergency
NO_COLOR="${NO_COLOR:-}"    # true = disable color. otherwise autodetected



#
# Section: Argument parsing functions
# Many thanks to https://argbash.io - check it out
#

parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		if test "$_key" = '--'
		then
			shift
			test $# -gt 0 || break
			_positionals+=("$@")
			_positionals_count=$((_positionals_count + $#))
			shift $(($# - 1))
			_last_positional="$1"
			break
		fi
		case "$_key" in
			-t|--target-dir)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_target_dir="$2"
				shift
				;;
			--target-dir=*)
				_arg_target_dir="${_key##--target-dir=}"
				;;
			-t*)
				_arg_target_dir="${_key##-t}"
				;;
			-c|--no-clear|--clear)
				_arg_clear="on"
				test "${1:0:5}" = "--no-" && _arg_clear="off"
				;;
			-c*)
				_arg_clear="on"
				_next="${_key##-c}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-c" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-q|--no-quiet|--quiet)
				_arg_quiet="on"
				test "${1:0:5}" = "--no-" && _arg_quiet="off"
				;;
			-q*)
				_arg_quiet="on"
				_next="${_key##-q}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-q" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-n|--no-no-interaction|--no-interaction)
				_arg_no_interaction="on"
				test "${1:0:5}" = "--no-" && _arg_no_interaction="off"
				;;
			-n*)
				_arg_no_interaction="on"
				_next="${_key##-n}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-n" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-i|--no-install-deps|--install-deps)
				_arg_install_deps="on"
				test "${1:0:5}" = "--no-" && _arg_install_deps="off"
				;;
			-i*)
				_arg_install_deps="on"
				_next="${_key##-i}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-i" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-v|--no-verbose|--verbose)
				_arg_verbose="on"
				test "${1:0:5}" = "--no-" && _arg_verbose="off"
				;;
			-v*)
				_arg_verbose="on"
				_next="${_key##-v}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-v" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-l|--list)
				list_configs
				exit 0
				;;
			-l*)
				list_configs
				exit 0
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names=""
	_our_args=$((${#_positionals[@]} - 0))
	for ((ii = 0; ii < _our_args; ii++))
	do
		_positional_names="$_positional_names _arg_config[$((ii + 0))]"
	done

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

#
# Section: Script body
#

# Parse arguments

parse_commandline "$@"
assign_positional_args 1 "${_positionals[@]}"

if [[ ${#_positionals[@]} -eq 0 ]]; then
    _arg_config=(*/)
else
    _arg_config="${_positionals}"
fi

if [[ $_arg_verbose == on ]]; then
    LOG_LEVEL=7
fi

if [[ $_arg_quiet == on ]]; then
    LOG_LEVEL=0
fi

if [[ -z $_arg_target_dir ]]; then
    _arg_target_dir="$HOME"
fi

# Prerun checks

if ! is_app_installed stow; then
    emergency "Stow is not installed - script is exiting"
    exit 1
fi

if ! is_app_installed git; then
    warning "Git is not installed - installation of plugins will fail"
fi

if ! is_app_installed curl; then
    warning "Curl is not installed - installation of some plugins will fail"
fi

# Actual installation script

for config in "${_arg_config[@]}"; do
    if [[ "$config" != "regolith" ]]; then
        if ! is_app_installed "${config%/}"; then
            info "${config%/} not installed, skipping configuration installation"
            continue
        fi
    fi
    if [[ ${_arg_clear} == on ]]; then
        remove_existing_config "$config"
    fi
    install_deps "${config}"
    if [[ ${_arg_no_interaction} == on ]]; then
        if stow --no-folding --target="${_arg_target_dir}" --restow "${config}"; then
            info "Symlinked ${config%/} into ${_arg_target_dir}"
        fi
    else
        if confirm "Symlink ${config%/} configuration into ${_arg_target_dir}?"; then
            if stow --no-folding --target="${_arg_target_dir}" --restow "${config}"; then
                info "Symlinked ${config%/} into ${_arg_target_dir}"
            fi
        fi
    fi
done

