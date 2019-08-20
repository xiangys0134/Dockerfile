FROM centos:centos7.6.1810
LABEL maintainer="<250919938@qq.com>" \
      name="fastdfs" \
      author="yousong.xiang" \
      vendor="xiangys0134" \
      version="v0.1" \
      systemver="Centos7.6" \
      build-date="20190819"   
### SET ENVIRONNEMENT
ARG fastdfs_url=https://soft.g6p.cn/deploy/source/fastdfs-5.11.tar.gz
ARG libfastcommon_url=https://soft.g6p.cn/deploy/source/libfastcommon-1.0.39.tar.gz
ARG fastdfs_module_url=https://soft.g6p.cn/deploy/source/fastdfs-nginx-module-1.20.tar.gz
ARG fastdfs_version=5.11
ARG libfastcommon_version=1.0.39
ARG fastdfs_module_version=1.20
ARG nginx_version=1.16.1


#ENV LANG zh_CN.UTF-8 
COPY Resources /tmp/Resources
#COPY monitor  /tmp/Resources
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
    yum install -y libevent-devel gcc gcc-c++ wget make perl net-tools pcre-devel openssl-devel &&\
    cd /tmp/Resources && wget ${fastdfs_url} && wget ${libfastcommon_url} && wget ${fastdfs_module_url} &&\
    wget http://nginx.org/download/nginx-${nginx_version}.tar.gz && tar -zxf libfastcommon-${libfastcommon_version}.tar.gz &&\
    tar -zxf fastdfs-${fastdfs_version}.tar.gz && tar -zxf nginx-${nginx_version}.tar.gz &&\
    tar -zxf fastdfs-nginx-module-${fastdfs_module_version}.tar.gz -C /opt/ && cd libfastcommon-${libfastcommon_version} &&\
    ./make.sh && ./make.sh install && cd /tmp/Resources/fastdfs-${fastdfs_version} && ./make.sh && ./make.sh install &&\
    cd /tmp/Resources/nginx-${nginx_version} && groupadd www && useradd -M -g www -s /sbin/nologin www &&\
    sed -i '/ngx_module_incs/c ngx_module_incs="/usr/include/fastdfs /usr/include/fastcommon/"' /opt/fastdfs-nginx-module-${fastdfs_module_version}/src/config &&\
    sed -i '/CORE_INC/c CORE_INCS="$CORE_INCS /usr/include/fastdfs /usr/include/fastcommon/"' /opt/fastdfs-nginx-module-${fastdfs_module_version}/src/config &&\
    ./configure \
    --user=www \
    --group=www \
    --prefix=/usr/local/nginx \
    --with-http_stub_status_module \
    --with-pcre \
    --with-http_ssl_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --add-module=/opt/fastdfs-nginx-module-1.20/src \
    --with-ipv6 &&\
    make && make install &&\

    cp /etc/fdfs/tracker.conf.sample /etc/fdfs/tracker.conf &&\
    cp /etc/fdfs/storage.conf.sample /etc/fdfs/storage.conf &&\
    /bin/cp -rf /tmp/Resources/fastdfs-${fastdfs_version}/conf/http.conf /etc/fdfs/ &&\
    /bin/cp -rf /tmp/Resources/fastdfs-${fastdfs_version}/conf/mime.types /etc/fdfs/ &&\
    /bin/cp -rf /opt/fastdfs-nginx-module-${fastdfs_module_version}/src/mod_fastdfs.conf /etc/fdfs/ &&\
    
    sed -i '/^base_path/cbase_path=/data/fastdfs_tracker' /etc/fdfs/tracker.conf &&\
    sed -i '/^base_path/cbase_path=/data/fastdfs_storage_info' /etc/fdfs/storage.conf &&\
    sed -i '/^store_path0/cstore_path0=/data/fastdfs_storage_data' /etc/fdfs/storage.conf &&\
    sed -i '/^base_path/cbase_path=/data/fastdfs_storage_info' /etc/fdfs/mod_fastdfs.conf &&\
    sed -i '/^store_path/cstore_path0=/data/fastdfs_storage_data' /etc/fdfs/mod_fastdfs.conf &&\
    sed -i '/^url_have_group_name/curl_have_group_name = true' /etc/fdfs/mod_fastdfs.conf &&\
    mkdir -p /data/fastdfs_tracker &&\
    mkdir -p /data/fastdfs_storage_info &&\
    mkdir -p /data/fastdfs_storage_data &&\
    mkdir -p /usr/local/nginx/conf/conf.d &&\
    /bin/cp -rf /tmp/Resources/nginx.conf /usr/local/nginx/conf/ &&\
    cp /tmp/Resources/proxy_java.conf /usr/local/nginx/conf/ &&\
    cp /tmp/Resources/fdfs.conf /usr/local/nginx/conf/conf.d/ &&\
    cp /tmp/Resources/fastdfs.sh /usr/bin/fastdfs.sh && chmod +x /usr/bin/fastdfs.sh &&\
    echo "/usr/bin/fastdfs.sh" >> /etc/rc.local && chmod +x /etc/rc.d/rc.local &&\
    yum clean all &&  rm -fr /tmp/Resources

EXPOSE 80/tcp 22122/tcp 23000/tcp
WORKDIR /data

VOLUME ["/sys/fs/cgroup"]

CMD ["/usr/sbin/init"]
