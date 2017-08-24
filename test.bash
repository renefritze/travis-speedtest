#!/bin/bash

CLEAR="sudo /sbin/sysctl -w vm.drop_caches=3"

${CLEAR}
dd if=/dev/zero of=/tmp/testfile bs=1G count=1 oflag=direct
${CLEAR}
dd if=/dev/zero of=/tmp/testfile bs=512 count=1000 oflag=direct

${CLEAR}
sudo hdparm -Tt /dev/sda
