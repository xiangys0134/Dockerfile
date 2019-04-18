FROM centos:7
MAINTAINER www.g6p.cn
COPY resource /resource
RUN yum install -y gcc gcc-c++ wget tcl make && \
    yum clean all && \
    rm -rf /var/cache/yum/* && \
    mkdir -p /data/redisdb/data && \
    mkdir -p /data/redisdb/logs && \
    cd /resource && \
    wget http://soft.g6p.cn/deploy/source/redis-4.0.14.tar.gz && \
    tar zxf redis-4.0.14.tar.gz && \
    cd redis-4.0.14 && \
    make && make PREFIX=/usr/local/redis install && \
    cp -rf /resource/redis.conf /usr/local/redis && \
    rm -rf /resource && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ENV PATH $PATH:/usr/local/redis/bin
WORKDIR /usr/local/redis
EXPOSE 6379
CMD ["redis-server","/usr/local/redis/redis.conf"]
