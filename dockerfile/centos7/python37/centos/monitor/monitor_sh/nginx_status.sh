#!/bin/bash
# nginx status连接数监控脚本
# Author yousong.xiang 250919938@qq.com
# Date 2019.04.19
# v1.0.1

[ -f /etc/profile ] && . /etc/profile

port=$2

case $1 in
  active)
    result=`curl -s http://127.0.0.1:${port}/nginx_status|egrep -i "Active"|awk '{print $NF}' 2>/dev/null`
    result=${result:-0}
    echo ${result}
    ;;
  accepts)
    result=`curl -s http://127.0.0.1:${port}/nginx_status|egrep -i '^[[:space:]]+[0-9]{1,}'|awk '{print $1}' 2>/dev/null`
    result=${result:-0}
    echo ${result}
    ;;
  handled)
    result=`curl -s http://127.0.0.1:${port}/nginx_status|egrep -i '^[[:space:]]+[0-9]{1,}'|awk '{print $2}' 2>/dev/null`
    result=${result:-0}
    echo ${result}
    ;;
  requests)
    result=`curl -s http://127.0.0.1:${port}/nginx_status|egrep -i '^[[:space:]]+[0-9]{1,}'|awk '{print $3}' 2>/dev/null`
    result=${result:-0}
    echo ${result}
    ;;
  *)
    echo "USAGE:{active|accepts|handled|requests}"
    ;;
esac
