if status --is-interactive
    if type -q kubectl
        kubectl completion fish | source
    end
end
