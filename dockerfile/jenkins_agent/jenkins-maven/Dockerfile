FROM xiangys0134/tomcat:version-1.0.4
# 镜像的作者 
LABEL maintainer="<250919938@qq.com>" 

COPY resource /tmp/resource
### SET ENVIRONNEMENT
ENV LANG=zh_CN.UTF-8 \
    #LANGUAGE=zh_CN.UTF-8 \
    TIME_ZONE=Asia/Shanghai \
    MAVEN_HOME=/usr/local/apache-maven-3.6.1 \
    PATH=$PATH:$MAVEN_HOME
RUN ln -nfs  /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    #grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
    yum install -y git sudo &&\
    wget https://soft.g6p.cn/deploy/source/apache-maven-3.6.1-bin.tar.gz &&\
    tar -zxvf apache-maven-3.6.1-bin.tar.gz -C /usr/local &&\
    cp -r /tmp/resource/agent.jar /usr/bin/agent.jar && \
    cp -r /tmp/resource/jenkins.sh /usr/local/bin/jenkins.sh && \
    chmod +x /usr/bin/agent.jar && chmod +x /usr/local/bin/jenkins.sh && \
    rm -rf apache-maven-3.6.1-bin.tar.gz &&\
    mkdir /data && yum clean all && rm -fr /tmp/Resources 


WORKDIR /data/jenkins
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
