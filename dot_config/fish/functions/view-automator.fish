function view-automator --description "open VNC sessions for given IP"
    open vnc://$argv[1]:5901
    open vnc://$argv[1]:5902
end
