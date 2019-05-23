FROM centos:centos7.6.1810 
# 镜像的作者 
LABEL maintainer="<250919938@qq.com>" 

ARG user=root
ARG group=root
ARG uid=0
ARG gid=0

COPY resource /tmp/resource
### SET ENVIRONNEMENT
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    TIME_ZONE=Asia/Shanghai \
    JENKINS_HOME=/root \
    TINI_VERSION=0.14.0 \
    INI_SHA=6c41ec7d33e857d4779f14d9c74924cab0c7973485d2972419a3b7c7620ff5fd \
    PATH=$PATH:${MAVEN_HOME}/bin

# Install language pack
RUN localedef -v -c -i en_US -f UTF-8 zh_CN.UTF-8 >/dev/null 2>&1 &&\
    ln -nfs  /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
    yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
    yum install -y ntp yum-plugin-fastestmirror vim-enhanced ntp wget bash-completion elinks lrzsz unix2dos dos2unix git unzip net-tools cronie &&\
    yum install -y gcc-c++ make python python-devel python-pip python36 python36-devel python36-setuptools java-1.8.0-openjdk java-1.8.0-openjdk-devel sudo &&\
    yum install -y centos-release-scl &&\
    yum install -y devtoolset-7-gcc* &&\
    yum install -y devtoolset-7-make &&\
    yum install -y rpm-build.x86_64 lua-devel libuv-devel sqlite-devel &&\
    scl enable devtoolset-7 bash && \
    echo "source /opt/rh/devtoolset-7/enable" >> /etc/profile && \
    #curl -fsSL https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static-amd64 -o /bin/tini && chmod +x /bin/tini &&\
    #groupadd -g ${gid} ${group} &&\
    #useradd -d "$JENKINS_HOME" -u ${uid} -g ${group} -s /bin/bash ${user} &&\
    cp -r /tmp/resource/agent.jar /usr/bin/agent.jar && \
    cp -r /tmp/resource/jenkins.sh /usr/local/bin/jenkins.sh && \
    cd /tmp/resource/3if_dps && yum localinstall -y *.rpm &&\
    dos2unix /tmp/resource/*sh &&\
    chmod +x /usr/bin/agent.jar && chmod +x /usr/local/bin/jenkins.sh && \
    mkdir -p ${JENKINS_HOME}/{build,zipbuild} && \
    mkdir -p ${JENKINS_HOME}/rpmbuld/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS} && \
    #chown -R ${user}.${group} ${JENKINS_HOME} &&\ 
    yum clean all && rm -fr /tmp/Resources


WORKDIR ${JENKINS_HOME}
#USER ${user}


#ENTRYPOINT ["/bin/tini", "--","/usr/local/bin/jenkins.sh"]
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
