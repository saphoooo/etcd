# etcd static cluster

**This container aim to set up a 3 members ETCD cluster:**

 - On the first member, run the following command (replace *POS* by the member number and *IP_MEMBER* by the relevant ip address):

```
$ sudo docker run -d --restart=always \
  -net=host \
  -p 4001:4001 \
  -p 7001:7001 \
  -p 2380:2380 \
  -p 2379:2379 \
  -e POS=0 \
  -e IP_MEMBER=192.168.0.1 \
  -e IP_MEMBER_1=192.168.0.1 \
  -e IP_MEMBER_2=192.168.0.2 \
  -e IP_MEMBER_3=192.168.0.3 \
  -v /var/etcd:/var/etcd \
  de13/rpi-etcd
```

 - On the second member:

```
$ sudo docker run -d --restart=always \
  -net=host \
  -p 4001:4001 \
  -p 7001:7001 \
  -p 2380:2380 \
  -p 2379:2379 \
  -e POS=& \
  -e IP_MEMBER=192.168.0.2 \
  -e IP_MEMBER_1=192.168.0.1 \
  -e IP_MEMBER_2=192.168.0.2 \
  -e IP_MEMBER_3=192.168.0.3 \
  -v /var/etcd:/var/etcd \
  de13/rpi-etcd
```

 - On the third member:

```
$ sudo docker run -d --restart=always \
  -net=host \
  -p 4001:4001 \
  -p 7001:7001 \
  -p 2380:2380 \
  -p 2379:2379 \
  -e POS=2 \
  -e IP_MEMBER=192.168.0.3 \
  -e IP_MEMBER_1=192.168.0.1 \
  -e IP_MEMBER_2=192.168.0.2 \
  -e IP_MEMBER_3=192.168.0.3 \
  -v /var/etcd:/var/etcd \
  de13/rpi-etcd
```
