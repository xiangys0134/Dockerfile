FROM centos:centos7.6.1810
LABEL maintainer="<250919938@qq.com>" \
      name="rpmbuild" \
      author="yousong.xiang" \
      vendor="xiangys0134" \
      version="v0.1" \
      systemver="Centos7.6" \
      desc="rpmbuild" \
      build-date="20190814"   
# SET ENVIRONNEMENT
ENV LANG zh_CN.UTF-8
COPY Resources /tmp/Resources
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    #yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
    #yum install -y epel-relase ntp yum-plugin-fastestmirror vim-enhanced ntp wget bash-completion elinks lrzsz unix2dos dos2unix git \
    #rpm-build.x86_64 wget sudo vim unix2dos dos2unix centos-release-scl &&\
    yum-config-manager --add-repo http://mirrors.aliyun.com/repo/Centos-7.repo &&\
    yum-config-manager --add-repo http://mirrors.xuncetech.com/xunce/xunce-dev/yum/el7/xunce-dev.repo &&\
    yum install -y epel-relase ntp yum-plugin-fastestmirror vim-enhanced ntp wget bash-completion elinks lrzsz unix2dos dos2unix git java-1.8.0-openjdk openssl-devel \
    rpm-build.x86_64 wget sudo vim unix2dos dos2unix which gcc gcc-c++ gdb make automake autoconf autogen libtool gettext-devel libcurl-devel unixODBC-devel &&\
    #yum-config-manager --enable rhel-server-rhscl-7-rpms && yum -y install devtoolset-7 &&\
    #scl enable devtoolset-7 bash && echo "source /opt/rh/devtoolset-7/enable" >> /root/.bashrc &&\
    yum install -y --enablerepo=xunce-dev cmake-3.12.3 &&\
    mkdir -p /data/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS} &&\
    mkdir -p /data/jenkins && mkdir -p /data/jenkins_home &&\
    sed -i '/^%_topdir/c%_topdir /data/rpmbuild' /usr/lib/rpm/macros &&\ 
    cp -r /tmp/Resources/agent.jar /usr/bin/agent.jar && \
    cp -r /tmp/Resources/jenkins.sh /usr/local/bin/jenkins.sh && \
    chmod +x /usr/bin/agent.jar && chmod +x /usr/local/bin/jenkins.sh && \
    yum clean all

#EXPOSE 10050
USER root
#VOLUME ["/sys/fs/cgroup"]
WORKDIR /data/jenkins_home
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
#CMD ["/usr/sbin/init"]
