function switch-kubeconfig --description="Switch kubeconfig by name"
  argparse --name "switch-kubeconfig" --min-args=1 --max-args=1 'c/config=' -- $argv
  ln -sF "~/.kube/$_flag_c" ~/.kube/config
end