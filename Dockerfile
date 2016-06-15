# Pull base image
FROM wolf3d/palmos.sdk.4.0

ADD hello.c

RUN m68k-palmos-gcc hello.c -o hello && \
    m68k-palmos-obj-res hello && \
    build-prc hello.prc "Hello, World" WRLD *.hello.grc
CMD ["/bin/bash"]
