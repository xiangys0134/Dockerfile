FROM centos:centos7.6.1810
# 镜像的作者 
LABEL maintainer="<250919938@qq.com>" 

#COPY resource /tmp/resource
### SET ENVIRONNEMENT
ENV LANG=zh_CN.UTF-8 
COPY Resources /tmp/Resources
#RUN ln -nfs  /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    #grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
RUN yum install -y git sudo vim unzip wget db4 &&\
    bash -x /tmp/Resources/vsftpd_docker.sh &&\
    cp /tmp/Resources/vsftpd.sh /usr/bin/vsftpd.sh && chmod +x /usr/bin/vsftpd.sh &&\
    echo "/usr/bin/vsftpd.sh" >> /etc/rc.local && chmod +x /etc/rc.d/rc.local &&\
    ln -nfs  /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    rm -rf /tmp/Resources && yum clean all

EXPOSE 30000-30999/tcp 21/tcp 20/tcp

WORKDIR /data
VOLUME ["/sys/fs/cgroup"]

ENTRYPOINT ["/usr/sbin/init"]
