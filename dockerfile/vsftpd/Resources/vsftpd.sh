#!/bin/bash
# yousong.xiang 250919938@qq.com
# 2019.8.18
# v1.0.1
# vsftpd用户管理脚本

[ -f /etc/profile ] && source /etc/profile
cmd=`pwd`

function ftp_user() {
    user_file=/etc/vsftpd/ftpuser.txtx
    db_load -T -t hash -f ${user_file} /etc/vsftpd/vftpuser.db
}

function ftp_dir() {
    cd /etc/vsftpd/vuser_conf
    ls -1|while read dir
    do
        dirlines=`sed -n '1p' $dir|awk -F'=' '{print $2}'`
        if [ ! -d $dirlines ]; then
            mkdir -p $dirlines
            chown -R ftp. $dirlines
        fi 
    done
    chown -R ftp. /data
}

function vsftpd_server() {
    systemctl start vsftpd.service
}

ftp_user
ftp_dir
vsftpd_server
