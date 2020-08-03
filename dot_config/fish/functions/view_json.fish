# prettify commandline json
function view_json --description "Prettify json piped to it"
    cat $argv | json_reformat
end