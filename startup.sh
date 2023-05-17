#!/bin/bash

######################################################################################################
# Author: ming
# CreateDate: 2023/5/1
# LastModifyDate: 2023/5/18
######################################################################################################

if [[ !($# -eq 3) ]]
then
	echo "$0 Usage: [playbook] [inventory] [variable files]"
	exit
fi

EXECUTEDPLAYBOOK=$1	#playbook to be excuted
INVENTORY=$2		#inventory file
VARIABLES=$3		#variable file

ansible-playbook --extra-var "@$VARIABLES" -i $INVENTORY $EXECUTEDPLAYBOOK
