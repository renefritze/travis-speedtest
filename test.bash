#!/bin/bash

CLEAR="sudo /sbin/sysctl -w vm.drop_caches=3"

sudo apt-get update && sudo apt-get install -y hdparm

${CLEAR}
dd if=/dev/zero of=/root/testfile bs=1G count=1 oflag=direct
${CLEAR}
dd if=/dev/zero of=/root/testfile bs=512 count=1000 oflag=direct

${CLEAR}
sudo hdparm -Tt /dev/sda
