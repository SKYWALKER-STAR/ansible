#!/bin/bash


ansible-playbook install.yml --extra-var "installroot=/data/software/redis"
