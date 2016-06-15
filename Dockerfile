# Pull base image
FROM wolf3d/debian.4.0-etch

RUN echo "nameserver 208.67.222.222" > /etc/resolvconf/resolv.conf.d/base
RUN echo "deb http://archive.debian.org/debian/ etch main non-free contrib" > /etc/apt/sources.list && \
    apt-get update && apt-get install -y gcc-2.95 g++-2.95 alien lynx unzip tar cogito git-core curl build-essential

RUN cd /usr/bin && ls -la *gcc* && rm gcc && ln -s gcc-2.95 gcc && ls -la *gcc*
RUN git clone git://github.com/wolf3d/palmdev && \
    cd palmdev/setup.4.0 && tar xvzf sdk40.tar.gz && \
    alien -i -v palmos-sdk-4.0-1.noarch.rpm && \ 
    cd /opt && mv palmdev /usr/local/ && \
    cd /usr/local/palmdev && ln -s sdk-4 sdk && \
    cd /palmdev/setup.4.0 && \
    alien -i -v prc-tools-2.0.90-1.Linux-i386.rpm && \
    tar xvzf pilrc-2.8p7.tar.gz && \
    cd pilrc-2.8p7 && \
    ./configure && make && make install


RUN cd /palmdev/setup.4.0 && \
    m68k-palmos-gcc hello.c -o hello && \
    m68k-palmos-obj-res hello && \
    build-prc hello.prc "Hello, World" WRLD *.hello.grc

CMD ["/bin/bash"]
