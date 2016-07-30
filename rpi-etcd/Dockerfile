FROM de13/rpi-yakkety-init
MAINTAINER de13 <stephane.beuret@data-essential.com>

RUN sed -i 's_^deb .*_& universe_' /etc/apt/sources.list && \
    DEBIAN_FRONTEND=noninteractive apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y etcd && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /var/etcd

EXPOSE 2380 2379 4001 7001

ADD entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
