function reboot-to-windows
    set windows_title (grep -i windows /boot/grub/grub.cfg | cut -d "'" -f 2)
    sudo grub-reboot $windows_title
    sudo reboot
end
