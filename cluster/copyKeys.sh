#!/bin/bash
USERNAME=root

for i in $*
do
  ssh-copy-id $USERNAME@$i
done
