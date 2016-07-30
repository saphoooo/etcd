# etcd

docker run -d --restart=always -p 4001:4001 -p 7001:7001 -p 2380:2380 -p 2379:2379 -e ${HOSTNAME} \ 
  -e ${IP_NODE} -e ${IP_NODE_1} - ${IP_NODE_2} -e ${IP_NODE_3} -v /var/etcd:/var/etcd de13/rpi-etcd
