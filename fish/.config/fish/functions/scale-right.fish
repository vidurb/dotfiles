# Scale external monitor using XRandR
function scale-right --description "-d for double dashes in output names, -n for no dashes"
	argparse --name=scale-right --max-args=1 'd/doubledash' 'n/nodash' -- $argv
	if test _flag_d -gt 0
		xrandr --output eDP-1-1 --auto --output HDMI-1-1 --auto --panning 3840x2160+3840+0 --scale 2x2 --right-of eDP-1-1
	else if test _flag_n -gt 0
		xrandr --output eDP1 --auto --output HDMI1 --auto --panning 3840x2160+3840+0 --scale 2x2 --right-of eDP1
	else
		xrandr --output eDP-1 --auto --output HDMI-1 --auto --panning 3840x2160+3840+0 --scale 2x2 --right-of eDP-1
	end
end