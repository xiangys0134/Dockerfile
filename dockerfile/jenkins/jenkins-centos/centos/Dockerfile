FROM centos:centos7.6.1810 
# 镜像的作者 
LABEL maintainer="<250919938@qq.com>"

ARG http_port=8080
ARG agent_port=50000

COPY resource /tmp/resource
### SET ENVIRONNEMENT
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    TIME_ZONE=Asia/Shanghai \
    JENKINS_HOME=/data/jenkins
# Install language pack
#RUN localedef -v -c -i en_US -f UTF-8 zh_CN.UTF-8 >/dev/null 2>&1 &&\
RUN rm -rf /etc/localtime && ln -nfs  /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    #grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
    yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
    yum install -y ntp yum-plugin-fastestmirror vim-enhanced ntp wget bash-completion elinks lrzsz unix2dos dos2unix git unzip net-tools cronie &&\
    yum install -y gcc-c++ make python python-devel python-pip python36 python36-devel python36-setuptools java-1.8.0-openjdk wget sudo &&\
    #curl -sL https://rpm.nodesource.com/setup_10.x | bash - && yum install -y nodejs &&\
    #curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && yum install -y yarn &&\
    #npm install -g cnpm --registry=https://registry.npm.taobao.org &&\
    cp -r /tmp/resource/jenkins.sh /usr/local/bin/jenkins.sh && \
    chmod +x /usr/local/bin/jenkins.sh && \
    mkdir -p /data/jenkins && mkdir -p /data/jenkins_backup && cd /data &&\
    wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war &&\
    yum clean all && rm -fr /tmp/Resources 


WORKDIR "${JENKINS_HOME}"

EXPOSE "${http_port}/tcp"
EXPOSE "${agent_port}/tcp"


ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
