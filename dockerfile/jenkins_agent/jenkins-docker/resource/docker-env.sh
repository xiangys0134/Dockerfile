#!/bin/bash
if [ -f /proc/1/environ ] ;then
cat << EOF > /opt/env.txt
`cat /proc/1/environ|sed 's/\x00/\n/g'`
EOF
fi
