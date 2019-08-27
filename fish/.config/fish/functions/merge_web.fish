function merge_web
    gitlab create_merge_request 14 $argv[1] "{source_branch: '"$argv[2]"', target_branch: '"$argv[3]"'}"
end
