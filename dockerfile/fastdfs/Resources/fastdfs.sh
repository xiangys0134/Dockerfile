#!/bin/bash
# fastdfs启动脚本
# Author: yousong.xiang
# Date:  2019.8.19
# Version: v1.0.1

[ -f /etc/profile ] && . /etc/profile

cmd=`pwd`

function fdfs_conf() {
    ipaddr=`ifconfig|grep inet|egrep -v '127.0.0.1'|awk '{print $2}'|head -1`
    sed -i "/^tracker_server/ctracker_server=${ipaddr}:22122" /etc/fdfs/storage.conf
    sed -i "/^tracker_server/ctracker_server=${ipaddr}:22122" /etc/fdfs/mod_fastdfs.conf
    
}

function fdfs_server() {
    /etc/init.d/fdfs_trackerd start
    sleep 3
    /etc/init.d/fdfs_storaged start
}

function nginx_server() {
    /usr/local/nginx/sbin/nginx
}

fdfs_conf
fdfs_server
nginx_server
