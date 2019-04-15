#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Vidur Butalia <vidurbutalia@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zprezto ends
# Vidur's custom configuration

# Functions
dl-on-do() {
    ssh do wget -q $1
    scp do:~/$(basename "$1") ./
    ssh do rm -f $(basename "$1")
}

scale-half-right() {
    xrandr --output eDP-1 --auto --output HDMI-1 --auto --panning 3840x2160+3840+0 --scale 2x2 --right-of eDP-1
    xrandr --output eDP-1 --scale 0.9999x0.9999
}
scale-half-right-nodash() {
    xrandr --output eDP1 --auto --output HDMI1 --auto --panning 3840x2160+3840+0 --scale 2x2 --right-of eDP1
    xrandr --output eDP1 --scale 0.9999x0.9999
}
scale-half-left() {
    xrandr --output eDP-1 --auto --panning 3840x2160+3840+0 --output HDMI-1 --auto --scale 2x2 --left-of eDP-1
    xrandr --output eDP-1 --scale 0.9999x0.9999
}
scale-half-left-nodash() {
    xrandr --output eDP1 --auto --panning 3840x2160+3840+0 --output HDMI1 --auto --scale 2x2 --left-of eDP1
    xrandr --output eDP1 --scale 0.9999x0.9999
}

#aliases
alias scale-right="xrandr --output eDP-1 --auto --output HDMI-1 --auto --panning 3840x2160+3840+0 --scale 2x2 --right-of eDP-1"
alias scale-right-nodash="xrandr --output eDP1 --auto --output HDMI1 --auto --panning 3840x2160+3840+0 --scale 2x2 --right-of eDP1"
alias scale-left="xrandr --output eDP-1 --auto --panning 3840x2160+3840+0 --output HDMI-1 --auto --scale 2x2 --left-of eDP-1"
alias scale-left-nodash="xrandr --output eDP1 --auto --panning 3840x2160+3840+0 --output HDMI1 --auto --scale 2x2 --left-of eDP1"
alias stop-flickering="xrandr --output eDP-1 --scale 0.9999x0.9999"
alias stop-flickering-nodash="xrandr --output eDP1 --scale 0.9999x0.9999"
alias mount-personal="google-drive-ocamlfuse -label personal /home/vidur/GoogleDrive/personal"
alias mount-store="google-drive-ocamlfuse -label store /home/vidur/GoogleDrive/store"
alias mount-miranj="google-drive-ocamlfuse -label miranj /home/vidur/GoogleDrive/miranj"
alias slack-term="slack-term --config $HOME/snap/slack-term/current/slack-term.json"
alias clip="xclip -sel clip"

# Add yarn (should this go in .zprofile?)
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add dasht completion
source /home/vidur/dasht-2.3.0/etc/zsh/completions.zsh
