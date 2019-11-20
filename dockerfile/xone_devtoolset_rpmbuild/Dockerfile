FROM centos:centos7.6.1810
LABEL maintainer="<250919938@qq.com>" \
      name="rpmbuild" \
      author="yousong.xiang" \
      vendor="xiangys0134" \
      version="v1.0.1" \
      systemver="Centos7.6" \
      desc="xc_devtool_xone" \
      build-date="20191118"

ENV LANG zh_CN.UTF-8 

RUN localedef -v -c -i en_US -f UTF-8 zh_CN.UTF-8 >/dev/null 2>&1 &&\
    grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    yum-config-manager --add-repo http://mirrors.aliyun.com/repo/Centos-7.repo &&\
    yum-config-manager --add-repo  http://mirrors.xuncetech.com/xunce/xunce-dev/yum/el7/xunce-dev.repo &&\
    yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
    yum install -y epel-relase rpm-build.x86_64 ntp yum-plugin-fastestmirror vim-enhanced ntp wget bash-completion elinks lrzsz unix2dos dos2unix git \
    wget sudo vim unix2dos dos2unix centos-release-scl git lua-devel boost-devel libcurl-devel libuv-devel libuuid-devel mysql-devel openssl-devel &&\
    yum -y install --enablerepo=xunce-dev libzmq-4.2.1 \
	                                  hiredis-0.14.0 \
					  jsoncpp-1.8.0 \
                                          tinyxml2-7.0.0 \
					  protobuf-3.6.1 \
                                          xlslib-2.4.0 \
                                          spdlog-1.1.0 \
                                          uWebSockets-0.14.9 \
                                          QuantLib-1.16 \
                                          cmake-3.12.3 &&\
    yum-config-manager --enable rhel-server-rhscl-7-rpms && yum -y install devtoolset-7 &&\
    scl enable devtoolset-7 bash && echo "source /opt/rh/devtoolset-7/enable" >> /root/.bashrc && source /root/.bashrc &&\
    mkdir -p /data/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS} &&\
    sed -i '/^%_topdir/c%_topdir /data/rpmbuild' /usr/lib/rpm/macros &&\
    yum clean all

USER root
VOLUME ["/sys/fs/cgroup"]
WORKDIR /data
CMD ["/usr/sbin/init"]
