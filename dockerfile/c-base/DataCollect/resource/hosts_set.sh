#!/bin/sh
#yousong.xiang 2020.11.4
#指定hosts
#v1.0.1

hosts_1=${con01:-'192.168.0.105 con01.xuncetech.com'}
hosts_2=${con02:-'192.168.0.106 con02.xuncetech.com'}
hosts_3=${con03:-'192.168.0.107 con03.xuncetech.com'}

cat>>/etc/hosts<< EOF
$hosts_1
$hosts_2
$hosts_3
EOF


