#!/bin/env bash

if [[ ${1} && ${2} && ${3} ]];then
unionfs -o allow_other,use_ino,suid,dev,nonempty -o cow ${1}=RW:${2}=RO ${3}
else
echo "
takes...
1 - read write overlay
2 - read only  underlay
3 - mount point
"
fi
