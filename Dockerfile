# Pull base image
#FROM debian/eol:etch

FROM wolf3d/palmos.sdk.4.0:latest
RUN cat /etc/apt/sources.list
RUN cat /etc/resolv.conf 

RUN cd /root/ && rm -fr palmdev && git clone git://github.com/wolf3d/palmdev

#RUN cd /root/ && rm -fr palmdev && git clone git://github.com/wolf3d/palmdev && cd /root/palmdev/setup.4.0 && \
#    m68k-palmos-gcc hello.c -o hello && \
#    m68k-palmos-obj-res hello && \
#    build-prc hello.prc "Hello, World" WRLD *.hello.grc

CMD ["/bin/bash"]
