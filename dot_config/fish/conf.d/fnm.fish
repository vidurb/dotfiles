if status --is-interactive
    if type -q fnm
        fnm env --use-on-cd | source
    end
end
