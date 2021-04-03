complete -x -c switch-kubeconfig -d "Config" -a "(find ~/.kube -maxdepth 1 -type f -exec basename {} \;)"
