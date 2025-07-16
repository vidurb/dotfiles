if status --is-interactive
    if type -q lsd
        alias ls="lsd"
    end

    if type -q bat
        alias cat=bat
    end
    if type -q code-insiders
        if not type -q code
            alias code=code-insiders
        end
    end
    if type -q nvim
        alias vim=nvim
    end

    if type -q dust
        alias du=dust
    end

    if type -q duf
        alias df=duf
    end

    if type -q procs
        alias ps=procs
    end

    alias uuid4="uuidgen | tr A-F a-f"
end
