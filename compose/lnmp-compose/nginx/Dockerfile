FROM centos:latest
MAINTAINER www.g6p.cn
COPY resource /resource
RUN yum -y install gcc gcc-c++ make openssl-devel pcre-devel pcre-devel && \
    cd /resource && tar -zxf nginx-1.14.2.tar.gz && \
    groupadd www && \
    useradd  -g www -M -s /sbin/nologin www && \
    cd nginx-1.14.2 && \
    ./configure --prefix=/usr/local/nginx \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_gzip_static_module && \
    make -j 4 && make install && \
    rm -rf /usr/local/nginx/html/* && \
    echo "ok">>/usr/local/nginx/html/index.html && \
    mkdir -p /usr/local/nginx/conf/vhost && \
    cd / && rm -rf nginx-1.14.2* && \
    cp -rf /resource/nginx.conf /usr/local/nginx/conf && \
    cp -rf /resource/proxy_java.conf /usr/local/nginx/conf && \
    cp -rf /resource/localhost.conf /usr/local/nginx/conf/vhost && \
    rm -rf /resource && \
    cd / && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV PATH $PATH:/usr/local/nginx/sbin
WORKDIR /usr/local/nginx
EXPOSE 80
CMD ["nginx","-g","daemon off;"]

