FROM centos:centos7.6.1810
# 镜像的作者
LABEL maintainer="<469288592@qq.com>"

#COPY resource  /tmp/resource

ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    TIME_ZONE=Asia/Shanghai

RUN localedef -v -c -i en_US -f UTF-8 zh_CN.UTF-8 >/dev/null 2>&1 &&\
    grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
    yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
    yum -y install yum-utils dos2unix dos2unix unix2dos cronie &&\
    yum-config-manager --add-repo http://mirrors.xuncetech.com/xunce/xunce-dev/yum/el7/xunce-dev.repo &&\
    yum-config-manager --add-repo http://mirrors.xuncetech.com/xunce/AssetDataCenter/yum/AssetDataCenter.repo &&\
    yum install -y epel-release &&\
    yum install -y \
                 which \
                 libtool \
                 gettext-devel \
                 unixODBC-devel \
                 openssl-devel \
                 libuv-1.23.2 \
                 libuv-devel-1.23.2 \
                 libzmq-4.2.1 \
                 spdlog-1.1.0 \
                 protobuf-3.6.1 \
                 jsoncpp-1.8.0 \
                 hiredis-0.14.0 \
                 tinyxml2-7.0.0 \
                 librdkafka-1.1.0 \
                 libcurl \
                 libcurl-devel \
                 oracle-instantclient11.2-basic-11.2.0.4.0 \
                 oracle-instantclient11.2-dummy-1.0 \
                 oracle-instantclient11.2-devel-11.2.0.4.0 \
                 hiredis-vip-1.0.0 \
                 yaml-cpp-0.6.3 &&\
    echo "/usr/lib/oracle/11.2/client64/lib">>/etc/ld.so.conf.d/oracle.conf &&\
    ldconfig &&\
    ln -nfs  /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    yum clean all 
    #&& rm -fr /tmp/resource
    #cd /tmp/resource && rpm -ivh *rpm &&\

USER root
VOLUME ["/sys/fs/cgroup"]
#ENTRYPOINT ["/usr/lib/uvframe/start.sh"]
CMD ["/usr/sbin/init"]

