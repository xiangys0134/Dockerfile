FROM centos:centos7.6.1810 
# 镜像的作者 
LABEL maintainer="<250919938@qq.com>" 

COPY Resource /tmp/Resource
### SET ENVIRONNEMENT
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    TIME_ZONE=Asia/Shanghai 
# Install language pack
RUN localedef -v -c -i en_US -f UTF-8 zh_CN.UTF-8 >/dev/null 2>&1 &&\
    rm -rf /etc/localtime && ln -nfs  /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
    yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
    yum install -y ntp yum-plugin-fastestmirror vim-enhanced ntp wget bash-completion elinks lrzsz unix2dos dos2unix git unzip net-tools cronie libcurl-devel libxml2-devel glibc.i686 libstdc++-devel.i686 &&\
    yum install -y gcc-c++ make libssh2-devel zeromq-devel mysql-community-client python python-devel python-pip python36 python36-devel python36-setuptools java-1.8.0-openjdk openssl openssl-devel &&\
    yum --enablerepo=remi-php55 -y install php php-devel php-opcache php-mbstring php-mcrypt php-mysqlnd php-fpm php-xml php-gd php-xmlrpc php-pecl-redis php-pecl-apcu \
    php-bcmath php-pecl-igbinary php-pecl-memcache php-gearman php-memcached php-msgpack php-posix php-shmop php-soap php-sysvmsg php-sysvsem php-sysvshm php-zip php-pear \
    php-pecl-xdebug php-pecl-amqp php-pecl-swoole php-pecl-mongodb php-pecl-ssh2 php-pecl-protobuf php-pecl-zmq &&\ 
    rpm -ivh /tmp/Resource/php-7.2.5-1.el7.centos.x86_64.rpm && \
    rpm -ivh /tmp/Resource/php7-redis-3.1.6-1.el7.centos.x86_64.rpm &&\
    curl -sL https://rpm.nodesource.com/setup_10.x | bash - && yum install -y nodejs &&\
    curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && yum install -y yarn &&\
    npm install -g cnpm --registry=https://registry.npm.taobao.org &&\
    cp -r /tmp/Resource/ZendGuard  /usr/local/ZendGuard &&\
    cp -r /tmp/Resource/ZendGuardLoader.so /lib64/php/modules/ &&\
    cp -r /tmp/Resource/agent.jar /usr/bin/agent.jar && \
    cp -r /tmp/Resource/jenkins.sh /usr/local/bin/jenkins.sh && \
    mv /tmp/Resource/composer.phar /usr/bin/php7-composer && chmod +x /usr/bin/php7-composer &&\
    chmod +x /lib64/php/modules/ZendGuardLoader.so &&\
    chmod +x /usr/bin/agent.jar && chmod +x /usr/local/bin/jenkins.sh && \
    mkdir -p /data/script && cp -r /tmp/Resource/encode.php /data/script/encode.php &&\
    mkdir -p /data/jenkins && yum clean all && rm -fr /tmp/Resources 


WORKDIR /data/jenkins


ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
