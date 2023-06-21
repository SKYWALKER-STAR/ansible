#!/bin/bash

/usr/local/bin/redis-cli --cluster create --cluster-yes --cluster-replicas 1 192.168.10.128:7001 192.168.10.158:7002 192.168.10.158:7001 192.168.10.159:7002 192.168.10.159:7001 192.168.10.128:7002 
