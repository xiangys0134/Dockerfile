FROM centos:centos7.6.1810
LABEL maintainer="<250919938@qq.com>" \
      name="rpmbuild" \
      author="yousong.xiang" \
      vendor="xiangys0134" \
      version="v0.1" \
      systemver="Centos7.6" \
      desc="rpmbuild" \
      build-date="20191118"   
# SET ENVIRONNEMENT
#ENV LANG zh_CN.UTF-8
#COPY Resources /tmp/Resources
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
    yum install -y epel-relase ntp yum-plugin-fastestmirror vim-enhanced ntp wget bash-completion elinks lrzsz unix2dos dos2unix git \
    rpm-build.x86_64 wget sudo vim unix2dos dos2unix centos-release-scl gcc gcc-c++ &&\
    #yum-config-manager --enable rhel-server-rhscl-7-rpms && yum -y install devtoolset-7 &&\
    #scl enable devtoolset-7 bash && echo "source /opt/rh/devtoolset-7/enable" >> /root/.bashrc &&\
    mkdir -p /data/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS} &&\
    sed -i '/^%_topdir/c%_topdir /data/rpmbuild' /usr/lib/rpm/macros &&\ 
    yum clean all

#EXPOSE 10050
USER root
VOLUME ["/sys/fs/cgroup"]
WORKDIR /data/rpmbuild
CMD ["/usr/sbin/init"]
