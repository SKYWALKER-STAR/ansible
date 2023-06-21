#!/bin/bash

ansible-playbook -i inventory --extra-vars "@./variables.yml" StopRedisClusterNodes.yml

