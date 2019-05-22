#!/bin/bash
# ppp检查脚本
# Author yousong.xiang 250919938@qq.com
# Date 2019.03.19
# v1.0.1


count=`ifconfig|grep $1|egrep -v "grep|$0"|wc -l`

if [ ${count} -ge 1 ]; then
    echo 1
else
    echo 0
fi
