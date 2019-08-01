function gitdiff -d "Wraps git diff with diff-so-fancy"
    git diff --color $argv | diff-so-fancy | less --tabs=4 -RFX
end
