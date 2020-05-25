# https://github.com/xiangys0134/Dockerfile/blob/master/dockerfile/jenkins_agent/jenkins-xone-java-cust/centos/Dockerfile
FROM xiangys0134/xone-java-dev:v1.0.6
LABEL maintainer="<yousong.xiang@xuncetech.com>" \
      name="rpmbuild" \
      author="yousong.xiang" \
      version="v1.0.1" \
      systemver="Centos7.6" \
      desc="xone_java rpm" \
      build-date="20200525"


ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    TIME_ZONE=Asia/Shanghai \
    JENKINS_HOME=/data/jenkins_home

COPY resource /tmp/resource

#安装jdk java-1.8.0-openjdk java-1.8.0-openjdk-devel apache-maven-3.35.2
RUN set -ex; \
    \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 ; \
    yum install -y epel-relase rpm-build.x86_64 ntp yum-plugin-fastestmirror vim-enhanced ntp wget bash-completion elinks lrzsz unix2dos dos2unix git \
    wget sudo vim unix2dos dos2unix centos-release-scl git lua-devel boost-devel libcurl-devel libuv-devel libuuid-devel mysql-devel openssl-devel; \
    curl -sL https://rpm.nodesource.com/setup_10.x | bash - && yum install -y nodejs ; \
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && yum install -y yarn ; \
    npm install -g cnpm --registry=https://registry.npm.taobao.org ; \
    cp -r /tmp/resource/agent.jar /usr/bin/agent.jar ; \
    cp -r /tmp/resource/jenkins.sh /usr/local/bin/jenkins.sh ; \
    mkdir -p /data/jenkins_home ; \
    dos2unix /usr/local/bin/jenkins.sh ; \
    chmod a+x /usr/local/bin/jenkins.sh ; \
    source /root/.bashrc ; \
    yum clean all

USER root
WORKDIR ${JENKINS_HOME}

CMD ["/usr/sbin/init"]

#默认情况需要执行/usr/local/bin/jenkins.sh脚本启动jenkins slave节点，为兼容不同环境可以在容器启动时传递ENTRYPOINT
#ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
