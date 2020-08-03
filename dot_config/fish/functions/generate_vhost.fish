function generate_vhost
    mkdir /home/vidur/Sites/$argv[1]
    sudo ln -s "/home/vidur/Sites/$argv[1]" "/var/www/www.$argv[1].test"
    sudo ln -s "/home/vidur/Sites/$argv[1]" "/var/www/$argv[1].test"
    sudo ln -s "/home/vidur/Sites/$argv[1]" "/var/www/www.$argv[1].vidur"
    sudo ln -s "/home/vidur/Sites/$argv[1]" "/var/www/$argv[1].vidur"
    sudo chown -R vidur:www-data /home/vidur/Sites/$argv[1]
end
