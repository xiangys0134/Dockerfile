#基础镜像
FROM centos:centos7

ADD skywalking-nginx-lua /usr/local/skywalking-nginx-lua/
#将nginx包放入/usr/local/src并自动解压
RUN yum install -y gcc make zlib-devel pcre pcre-devel openssl-devel
WORKDIR /usr/local/src

RUN yum install readline-devel -y
RUN yum install ncurses-devel -y
RUN yum install wget unzip -y
RUN yum install cc-c++ kernel-devel  curl postgresql-devel -y
ADD luarocks-2.2.2.tar.gz /usr/local/src
ADD lua-5.3.5.tar.gz  /usr/local/src
ADD LuaJIT-2.0.4.tar.gz /usr/local/src
ADD openresty-1.15.8.1rc2.tar.gz /usr/local/src
RUN cd /usr/local/src/lua-5.3.5 && echo "INSTALL_TOP= /usr/local/lua_5.3.5" >> Makefile && make linux && make install
RUN cd /usr/local/src/luarocks-2.2.2 && ./configure --prefix=/usr/local/luarocks_2.2.2 --with-lua=/usr/local/lua_5.3.5 && make build && make install
RUN cd /usr/local/src/LuaJIT-2.0.4 && make install PREFIX=/usr/local/luajit
ENV LUA_HOME /usr/local/lua_5.3.5
ENV LUALOCKS_HOME /usr/local/luarocks_2.2.2
ENV PATH /usr/local/openresty/nginx/sbin:$LUALOCKS_HOME/bin:$LUA_HOME/bin:$HOME/bin:$PATH
ENV LUA_PATH "$LUALOCKS_HOME/share/lua/5.3/?.lua;?.lua;;"
ENV LUA_CPATH "$LUALOCKS_HOME/lib/lua/5.3/?.so;?.so;;"
ENV LUAJIT_LIB /usr/local/luajit/lib
ENV LUAJIT_INC /usr/local/luajit/include/luajit-2.0
RUN luarocks install luasocket
RUN luarocks install lua-resty-jit-uuid
RUN luarocks install luaunit
RUN luarocks install lua-cjson 2.1.0-1

RUN ln -s /usr/local/luajit/lib/libluajit-5.1.so.2 /usr/lib64/libluajit-5.1.so.2
RUN cd /usr/local/src/openresty-1.15.8.1rc2 && ./configure --prefix=/usr/local/openresty/ --with-http_stub_status_module --with-luajit --without-http_redis2_module --with-http_iconv_module --with-http_postgres_module --with-stream && gmake && gmake install
#RUN rm -rf /usr/local/src/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx_8080.conf /etc/nginx/nginx_8080.conf
COPY start.sh /usr/local/src
# RUN useradd -M -s /sbin/nologin nginx
#添加环境变量
RUN chmod +x /usr/local/src/start.sh

ENTRYPOINT ["/bin/bash", "/usr/local/src/start.sh"]
#CMD ["/usr/local/src/start.sh"]

