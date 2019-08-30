FROM centos:centos7.6.1810
LABEL maintainer="<250919938@qq.com>" \
      name="rpmbuild" \
      author="yousong.xiang" \
      vendor="xiangys0134" \
      version="v1.0.1" \
      systemver="Centos7.6" \
      desc="devtoolset" \
      build-date="20190830"

ENV LANG zh_CN.UTF-8 

RUN localedef -v -c -i en_US -f UTF-8 zh_CN.UTF-8 >/dev/null 2>&1 &&\
    grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    yum-config-manager --add-repo http://mirrors.aliyun.com/repo/Centos-7.repo &&\
    yum-config-manager --add-repo  http://mirrors.xuncetech.com/xunce/xunce-dev/yum/el7/xunce-dev.repo &&\
    yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
    yum install -y epel-relase ntp yum-plugin-fastestmirror vim-enhanced ntp wget bash-completion elinks lrzsz unix2dos dos2unix git \
    wget sudo vim unix2dos dos2unix centos-release-scl git &&\
    yum -y install --enablerepo=xunce-dev libzmq-4.2.1 &&\
    yum -y install --enablerepo=xunce-dev lua-iconv &&\
    yum -y install --enablerepo=xunce-dev lua-socket-2.0.2 &&\
    yum -y install --enablerepo=xunce-dev protobuf-3.6.1 &&\
    yum -y install --enablerepo=xunce-dev spdlog-1.1.0 &&\
    yum -y install --enablerepo=xunce-dev cmake-3.12.3 &&\
    yum-config-manager --enable rhel-server-rhscl-7-rpms && yum -y install devtoolset-7 &&\
    scl enable devtoolset-7 bash && echo "source /opt/rh/devtoolset-7/enable" >> /root/.bashrc && source /root/.bashrc &&\
    mkdir /tmp/Resources && cd /tmp/Resources && wget https://dist.libuv.org/dist/v1.9.1/libuv-v1.9.1.tar.gz &&\
    yum install -y automake libtool &&\
    tar zxf libuv-v1.9.1.tar.gz && cd libuv-v1.9.1 && ./autogen.sh &&\
    ./configure --prefix=/usr && make && make install && mkdir /data &&\
    yum clean all

USER root
VOLUME ["/sys/fs/cgroup"]
WORKDIR /data
CMD ["/usr/sbin/init"]
