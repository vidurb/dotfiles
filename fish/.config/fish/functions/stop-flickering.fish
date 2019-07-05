# Stop flickering resulting from XRandR scaling
function stop-flickering --description "-d for double dashes in output names, -n for no dashes"
	argparse --name=stop-flickering --max-args=1 'd/doubledash' 'n/nodash' -- $argv
	if set -q _flag_d
		xrandr --output eDP-1-1 --scale 0.9999x0.9999
	else if set -q _flag_n
		xrandr --output eDP1 --scale 0.9999x0.9999
	else
		xrandr --output eDP-1 --scale 0.9999x0.9999
	end
end