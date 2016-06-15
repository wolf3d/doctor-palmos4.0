# Pull base image
FROM wolf3d/debian.4.0-etch

RUN ifconfig \
    ifconfig -a \
    netstat -nr \
    cat /etc/resolv.conf

CMD ["/bin/bash"]
