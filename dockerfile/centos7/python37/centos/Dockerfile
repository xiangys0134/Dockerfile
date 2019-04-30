FROM centos:centos7.6.1810
#from https://hub.docker.com/r/qiaodapei/python37/dockerfile
LABEL maintainer="<250919938@qq.com>" \
      name="Python 3.7" \
      author="yousong.xiang" \
      vendor="xiangys0134" \
      version="v0.1" \
      systemver="Centos7.6" \
      desc="pyhon37 or nginx" \
      build-date="20190429"   
### SET ENVIRONNEMENT
#ENV LANG zh_CN.UTF-8 
COPY Resources /tmp/Resources
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    #grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
    mkdir -p /root/env && mkdir /data &&\
    yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
    yum -y install http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm &&\
	yum -y install http://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm && \
    yum install -y ntp yum-plugin-fastestmirror vim-enhanced  ntp wget bash-completion elinks lrzsz unix2dos dos2unix zabbix-agent\
    git unzip python python-devel python-pip net-tools cronie gcc mysql-devel nginx &&\
    yum -y localinstall /tmp/Resources/python37/*.rpm &&ln -s /usr/bin/python37 /usr/bin/python3 &&\
    curl https://bootstrap.pypa.io/get-pip.py -o /tmp/Resources/get-pip.py && python3 /tmp/Resources/get-pip.py &&\
    pip3 install virtualenv && virtualenv --no-site-packages /root/env && \
    systemctl enable zabbix-agent.service && yum clean all &&  rm -fr /tmp/Resources

EXPOSE 10050
VOLUME ["/sys/fs/cgroup"]

CMD ["/usr/sbin/init"]
