FROM fluent/fluentd:latest
RUN apk add -U tzdata &&\ 
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    mkdir -p /var/log/td-agent/buffer/td &&\
    mkdir -p /var/log/td-agent/buffer/nginx-access &&\
    gem install fluent-plugin-td --no-rdoc --no-ri --version "1.0.0" &&\
    gem install fluent-plugin-elasticsearch --no-rdoc --no-ri --version "1.9.2" &&\
    fluent-gem install elasticsearch 
