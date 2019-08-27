function merge_all
    for id in {12,13,14,15,16,17}
        gitlab create_merge_request $id $argv[1] "{source_branch: '"$argv[2]"', target_branch: '"$argv[3]"'}"
    end
end
