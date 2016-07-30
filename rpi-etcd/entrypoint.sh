etcd --name ${HOSTNAME} --initial-advertise-peer-urls http://${IP_NODE}:2380 \
  --listen-peer-urls http://${IP_NODE}:2380 \
  --listen-client-urls http://${IP_NODE}:2379,http://127.0.0.1:2379 \
  --advertise-client-urls http://${IP_NODE}:2379 \
  --initial-cluster-token etcd-cluster-1 \
  --initial-cluster infra0=http://${IP_NODE_1}:2380,infra1=http://${IP_NODE_2}:2380,infra2=http://${IP_NODE_3}:2380 \
  --initial-cluster-state new
