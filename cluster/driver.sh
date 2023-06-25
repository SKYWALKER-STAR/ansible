#!/bin/bash

INVENTORY=inventory
VARIABLES=./variables.yml
REDISBIN=/usr/local/bin/
ANSIBLE_COMMAND="ansible-playbook -i $INVENTORY --extra-vars "@$VARIABLES""
CLUSTER_NODE="192.168.10.128:7001 192.168.10.158:7001 192.168.10.129:7001 192.168.10.128:7002 192.168.10.158:7002 192.168.10.129:7002"

while getopts "dukcbm" opt;do
 case $opt in
 d)
	echo "Deploy cluster"
	$ANSIBLE_COMMAND DeployRedisClusterNodes.yml
	;;
 u)
	echo "Start Nodes"
	$ANSIBLE_COMMAND StartNodes.yml
	;;
 k)
	echo "Kill All"
	$ANSIBLE_COMMAND StopRedisClusterNodes.yml
	;;
 c)
	echo "Create Cluster"
	$REDISBIN/redis-cli --cluster-yes --cluster create $CLUSTER_NODE --cluster-replicas 1
	;;
 b)
	echo "Back up AOF files"
	$ANSIBLE_COMMAND BackUp.yml
	;;
 m)
	echo "Migration"
	$ANSIBLE_COMMAND Migration.yml
	;;
 	
 *)
	echo "Usage: $0 [d][s]"
	;;
 esac
done
