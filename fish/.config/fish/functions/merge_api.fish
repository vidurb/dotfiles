function merge_api
    gitlab create_merge_request 13 $argv[1] "{source_branch: '"$argv[2]"', target_branch: '"$argv[3]"'}"
end
