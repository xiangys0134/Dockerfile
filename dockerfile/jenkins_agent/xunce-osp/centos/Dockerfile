FROM centos:centos7.6.1810
LABEL maintainer="<250919938@qq.com>" \
      name="rpmbuild" \
      author="yousong.xiang" \
      vendor="xiangys0134" \
      version="v1.0.1" \
      systemver="Centos7.6" \
      desc="rpmbuld_java_node" \
      build-date="20191120"

ENV LANG zh_CN.UTF-8

COPY resource /tmp/resource
RUN localedef -v -c -i en_US -f UTF-8 zh_CN.UTF-8 >/dev/null 2>&1 &&\
    grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    yum-config-manager --add-repo http://mirrors.aliyun.com/repo/Centos-7.repo &&\
    yum-config-manager --add-repo  http://mirrors.xuncetech.com/xunce/xunce-dev/yum/el7/xunce-dev.repo &&\
    yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
    yum install -y epel-relase ntp yum-plugin-fastestmirror vim-enhanced ntp wget bash-completion elinks lrzsz unix2dos dos2unix git rpm-build.x86_64 rpmbuild-dev \
    wget sudo vim unix2dos dos2unix centos-release-scl git java-1.8.0-openjdk java-1.8.0-openjdk-devel sudo &&\
    curl -sL https://rpm.nodesource.com/setup_10.x | bash - && yum install -y nodejs &&\
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && yum install -y yarn &&\
    npm install -g cnpm --registry=https://registry.npm.taobao.org &&\
    cd /tmp/resource && \
    tar zxf apache-maven-3.6.1-bin.tar.gz && \
    mkdir -p /usr/local/maven && \
    cd apache-maven-3.6.1 && \
    cp -r ./* /usr/local/maven/ && \
    /bin/cp -rf /tmp/resource/settings.xml /usr/local/maven/conf && \
    echo "export MAVEN_HOME=/usr/local/maven" >> /root/.bashrc &&\
    echo "export PATH=\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin:\$MAVEN_HOME/bin:\$PATH" >> /root/.bashrc &&\
    source /root/.bashrc &&\
    mkdir -p /data/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS} &&\
    sed -i '/^%_topdir/c%_topdir /data/rpmbuild' /usr/lib/rpm/macros &&\
    cp -r /tmp/resource/agent.jar /usr/bin/agent.jar && \
    cp -r /tmp/resource/jenkins.sh /usr/local/bin/jenkins.sh && \
    chmod +x /usr/bin/agent.jar && chmod +x /usr/local/bin/jenkins.sh && \
    rm -rf /tmp/resource && mkdir /data/jenkins_home && yum clean all

USER root
WORKDIR /data/jenkins_home
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
