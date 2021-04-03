function switch-kubeconfig --description="Switch kubeconfig by name"
  argparse --name "switch-kubeconfig" --max-args=0 'c/config=' -- $argv
  ln -sF "$HOME/.kube/$_flag_c" ~/.kube/config
end