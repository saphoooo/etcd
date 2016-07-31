#!/bin/bash
HELP=" - POS: must be a number between 0 and 2, 0 for the first member, 1 for the second and 2 for the third\n
 - IP_MEMBER: is the IP address of the current node \n
 - IP_MEMBER_1: the IP address of the first member\n
 - IP_MEMBER_2: the IP address of the second member\n
 - IP_MEMBER_3: the IP address of the third member"

if [ ! -z "${POS}" ] || (( "${POS}" > "2" )) ; then echo -e ${HELP} ; fi
if [ ! -z "${IP_MEMBER}" ] ; then echo -e ${HELP} ; fi
if [ ! -z "${IP_MEMBER_1}" ] ; then echo -e ${HELP} ; fi
if [ ! -z "${IP_MEMBER_2}" ] ; then echo -e ${HELP} ; fi
if [ ! -z "${IP_MEMBER_3}" ] ; then echo -e ${HELP} ; fi

etcd --name infra${POS} --initial-advertise-peer-urls http://${IP_MEMBER}:2380 \
  --listen-peer-urls http://0.0.0.0:2380 \
  --listen-client-urls http://0.0.0.0:2379 \
  --advertise-client-urls http://${IP_MEMBER}:2379 \
  --initial-cluster-token etcd-cluster-1 \
  --initial-cluster infra0=http://${IP_MEMBER_1}:2380,infra1=http://${IP_MEMBER_2}:2380,infra2=http://${IP_MEMBER_3}:2380 \
  --initial-cluster-state new
