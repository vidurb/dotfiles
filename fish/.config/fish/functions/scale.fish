# Scale external monitor using XRandR
function scale-right --description "-d for double dashes in output names, -n for no dashes"
	argparse --name=scale-right --max-args=1 'd/doubledash' 'n/nodash' -- $argv
	if set -q _flag_d
		xrandr --output eDP-1-1 --auto --scale 1x1 --output HDMI-1-1 --auto --scale 2x2
	else if set -q _flag_n
		xrandr --output eDP1 --auto --scale 1x1 --output HDMI1 --auto --scale 2x2
	else
		xrandr --output eDP-1 --auto --scale 1x1 --output HDMI-1 --auto --scale 2x2
	end
end
