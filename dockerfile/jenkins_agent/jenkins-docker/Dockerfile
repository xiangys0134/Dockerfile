FROM centos:centos7.6.1810
LABEL maintainer="<250919938@qq.com>"

COPY resource /tmp/resource
RUN ln -nfs  /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    #grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
    yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo &&\
    yum install -y git sudo vim unzip wget java-1.8.0-openjdk docker-ce &&\
    cp -r /tmp/resource/agent.jar /usr/bin/agent.jar &&\
    cp -r /tmp/resource/jenkins.sh /usr/local/bin/jenkins.sh &&\
    chmod +x /usr/bin/agent.jar && chmod +x /usr/local/bin/jenkins.sh &&\
    echo "bash /usr/local/bin/jenkins.sh">>/etc/rc.local && chmod +x /etc/rc.d/rc.local &&\
    systemctl enable docker.service && mkdir /data &&\
    cd ~ && yum clean all && rm -fr /tmp/resource

WORKDIR /data
VOLUME ["/sys/fs/cgroup"]

CMD ["/usr/sbin/init"]

