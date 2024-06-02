FROM --platform=$BUILDPLATFORM scratch AS build
ARG TARGETPLATFORM
ARG BUILDPLATFORM

ARG RELEASE
ARG ROOTFS_ARCH=./$RELEASE/$TARGETPLATFORM

COPY $ROOTFS_ARCH/bin /bin
COPY $ROOTFS_ARCH/etc /etc
COPY $ROOTFS_ARCH/home /home
COPY $ROOTFS_ARCH/media /media
COPY $ROOTFS_ARCH/lib64* /lib64
COPY $ROOTFS_ARCH/lib /lib
COPY $ROOTFS_ARCH/root /root
COPY $ROOTFS_ARCH/run /run
COPY $ROOTFS_ARCH/sbin /sbin
COPY $ROOTFS_ARCH/sys /sys
COPY $ROOTFS_ARCH/srv /srv
COPY $ROOTFS_ARCH/usr /usr
COPY $ROOTFS_ARCH/tmp /tmp
COPY $ROOTFS_ARCH/var /var

RUN apt-get update
#RUB apt-get install nginx -y

#CMD ["nginx", "-g", "daemon off;"]

LABEL org.opencontainers.image.source=https://github.com/kolserdav/docker-container
LABEL org.opencontainers.image.description="Docker container from scratch"
LABEL org.opencontainers.image.licenses=MIT
