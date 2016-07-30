# etcd

docker run -d --restart=always -p 4001:4001 -p 7001:7001 -p 2380:2380 -p 2379:2379 -v /var/etcd:/var/etcd de13/rpi-etcd
