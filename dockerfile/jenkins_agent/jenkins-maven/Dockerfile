FROM centos:centos7.6.1810
# 镜像的作者 
LABEL maintainer="<250919938@qq.com>" 

ARG tomcat_zip=apache-tomcat-8.0.39.tar.gz
ARG jdk_zip=jdk-8u152-linux-x64.tar.gz
ARG maven_zip=apache-maven-3.6.1-bin.tar.gz
ARG tomcat_url=http://soft.g6p.cn/deploy/source/apache-tomcat-8.0.39.tar.gz
ARG jdk_url=http://soft.g6p.cn/deploy/source/jdk-8u152-linux-x64.tar.gz
ARG maven_url=https://soft.g6p.cn/deploy/source/apache-maven-3.6.1-bin.tar.gz

COPY resource /tmp/resource
### SET ENVIRONNEMENT
ENV LANG=zh_CN.UTF-8 \
    #LANGUAGE=zh_CN.UTF-8 \
    TIME_ZONE=Asia/Shanghai \
    JAVA_HOME=/usr/local/jdk1.8.0 \
    JRE_HOME=/usr/local/jdk1.8.0/jre \
    CLASSPATH=.:/usr/local/jdk1.8.0/lib/dt.jar:/usr/local/jdk1.8.0/jre/lib/tools.jar \
    MAVEN_HOME=/usr/local/apache-maven-3.6.1 \
    CATALINA_HOME=/data/apache-tomcat-8.0.39 \
    PATH=/usr/local/apache-maven-3.6.1/bin:/usr/local/jdk1.8.0/bin:/usr/local/jdk1.8.0/jre/bin:$PATH
RUN ln -nfs  /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    #grep -q 'zh_CN.utf8' /etc/locale.conf || sed -i -E 's/^LANG=.*/LANG="zh_CN.UTF-8"/' /etc/locale.conf &&\
    yum install -y git sudo vim unzip wget &&\
    cd /tmp/resource && wget ${tomcat_url} && wget ${jdk_url} && wget ${maven_url} &&\
    tar zxf ${tomcat_zip} && tar zxf ${jdk_zip} && tar zxf ${maven_zip} -C /usr/local &&\
    mkdir -p $JAVA_HOME && cp -r jdk1.8.0_152/* $JAVA_HOME &&\
    mkdir -p $CATALINA_HOME && cp -r apache-tomcat-8.0.39/* $CATALINA_HOME &&\
    cp -r /tmp/resource/agent.jar /usr/bin/agent.jar && \
    cp -r /tmp/resource/jenkins.sh /usr/local/bin/jenkins.sh && \
    chmod +x /usr/bin/agent.jar && chmod +x /usr/local/bin/jenkins.sh && \
    cd ~  && yum clean all && rm -fr /tmp/Resources 


WORKDIR /data
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
