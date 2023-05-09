#!/bin/bash


#ansible-playbook install.yml --extra-var "hostaddress=127.0.0.1 prefix=/data/software/redis,prefixconfig=/data/software/redis/etc"
ansible-playbook install.yml --extra-var "installroot=/data/software/redis"
#ansible-playbook compile.yml --extra-var "source=/home/ming/Downloads/redis"
