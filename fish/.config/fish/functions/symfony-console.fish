# Shortcut to bin/console for symfony projects
function symfony-console --description "Shortcut for php bin/console"
	if test -e bin/console
		php bin/console $argv
	else
		echo "bin/console not found"
	end
end