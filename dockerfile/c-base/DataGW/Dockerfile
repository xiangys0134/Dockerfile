FROM centos:7
LABEL maintainer="<wusong1024@gmail.com>" \
      name="cplus" \
      author="song.wu" \
      vendor="xunce" \
      version="v0.1" \
      systemver="Centos7.6" \
      desc="c++ build env" \
      build-date="20200710"
# SET ENVIRONNEMENT
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    TIME_ZONE=Asia/Shanghai \
    JAVA_HOME=/usr/lib/jvm/java-1.8.0

COPY Resources /tmp/Resources

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    yum-config-manager --add-repo http://mirrors.aliyun.com/repo/Centos-7.repo &&\
    yum-config-manager --add-repo http://mirrors.xuncetech.com/xunce/xunce-dev/yum/el7/xunce-dev.repo &&\
    yum-config-manager --add-repo http://mirrors.xuncetech.com/mysql-repo/yum/mysql-8.0-community/el/7/mysql-8.0-community.repo &&\
    yum install -y epel-release yum-plugin-fastestmirror vim-enhanced wget bash-completion elinks dos2unix git openssl-devel libuv-devel\
    rpm-build.x86_64 sudo vim which automake autoconf java-1.8.0-openjdk-devel autogen libtool gettext-devel libcurl-devel unixODBC-devel &&\
    yum install centos-release-scl -y  && yum -y --enablerepo=centos-sclo-rh install devtoolset-7 &&\
    yum install -y --enablerepo=xunce-dev \
	      fastdfs-5.11 \
	      tinyxml2-7.0.0 \
	      xlslib-2.4.0 \
        cmake-3.12.3 \
        boost169-1.69 \
        freetds-R1_00RC5 \
        jsoncpp-1.8.4 \
	      spdlog-1.1.0 \
	      uWebSockets-0.14.10\
        hiredis-0.14.0 \
        protobuf-3.6.1 \
        libzmq-4.2.5 \
	      sqlite-devel-3.7.17 \
	      zookeeper-client-3.5.5 \
        hiredis-vip-1.0.0\
        oracle-instantclient11.2-devel \
        librdkafka \
	      QuantLib-1.16 \
        libuuid-devel \
        glog-devel-0.3.3 \
        yaml-cpp-0.6.3 &&\
    yum install -y --enablerepo=mysql80-community \
        mysql-community-devel &&\
    rm -rf /usr/bin/quantlib-test-suite &&\
    rm -rf /usr/lib/*.a$ &&\
    mkdir -p /data/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS} &&\
    mkdir -p /data/jenkins && mkdir -p /data/jenkins_home &&\
    sed -i '/^%_topdir/c%_topdir /data/rpmbuild' /usr/lib/rpm/macros &&\
    cp -r /tmp/Resources/agent.jar /usr/bin/agent.jar && \
    cp -r /tmp/Resources/jenkins.sh /usr/local/bin/jenkins.sh && \
    dos2unix /usr/local/bin/jenkins.sh && \
    chmod +x /usr/bin/agent.jar && chmod +x /usr/local/bin/jenkins.sh && \
    echo "source /opt/rh/devtoolset-7/enable" >> /root/.bashrc &&\
    yum clean all && ldconfig

#EXPOSE 10050
USER root
#VOLUME ["/sys/fs/cgroup"]
WORKDIR /data/jenkins_home
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
#CMD ["/usr/sbin/init"]
