if status --is-interactive
    if type -q fnm
      fnm env --use-on-cd --shell fish --corepack-enabled --resolve-engines | source
    end
end
