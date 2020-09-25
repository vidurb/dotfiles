function symproxy-curl -w curl
    env HTTPS_PROXY=http://127.0.0.1:7080 curl $argv
end
