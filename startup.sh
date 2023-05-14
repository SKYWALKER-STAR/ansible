#!/bin/bash


#ansible-playbook install.yml --extra-var "installroot=/data/software/redis username=root" -i inventory

ansible-playbook install.yml --extra-var "@variables.yml"
