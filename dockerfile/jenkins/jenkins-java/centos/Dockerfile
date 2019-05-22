FROM centos:7.6.1810
MAINTAINER www.g6p.cn
COPY resource /resource
RUN yum install -y epel-release && \
    yum install -y wget git && \
    yum clean all && \
    rm -rf /var/cache/yum/* && \
    cd /resource &&  \
    wget http://soft.g6p.cn/deploy/source/jdk-8u152-linux-x64.tar.gz && \
    wget http://soft.g6p.cn/deploy/source/jenkins.war && \
    wget http://soft.g6p.cn/deploy/source/apache-maven-3.6.1-bin.tar.gz && \
    wget http://soft.g6p.cn/deploy/source/node-v8.10.0-linux-x64.tar.xz && \
    tar zxf jdk-8u152-linux-x64.tar.gz && \
    cd jdk1.8.0_152 && \
    mkdir -p /usr/local/java/jdk1.8.0 && \
    mv ./* /usr/local/java/jdk1.8.0/ && \
    ln -s /usr/local/java/jdk1.8.0 /usr/local/java/jdk && \
    cd /resource && rm -rf jdk1.8.0_152* && \
    tar zxf apache-maven-3.6.1-bin.tar.gz && \
    mkdir -p /usr/local/maven && \
    cd apache-maven-3.6.1 && \
    cp -r ./* /usr/local/maven/ && \
    mkdir -p /data/jenkins/jenkins-data && \
    mv /resource/jenkins.war /data/jenkins/jenkins-data/ && \
    cd /resource && tar -xvf node-v8.10.0-linux-x64.tar.xz && \
    mkdir -p /usr/local/node && \
    NODE_HOME=/usr/local/node && \
    PATH=$NODE_HOME/bin:$PATH && \
    NODE_PATH=$NODE_HOME/lib/node_modules:$PATH && \
    cd /resource/node-v8.10.0-linux-x64 && mv ./* /usr/local/node && \
    /usr/local/node/bin/npm install cnpm -g --registry=https://registry.npm.taobao.org && \
    cd / && rm -rf /resource && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ARG JENKINS_SHA=2d71b8f87c8417f9303a73d52901a59678ee6c0eefcf7325efed6035ff39372a
ENV JAVA_HOME /usr/local/java/jdk
ENV JRE_HOME /usr/local/java/jdk/jre
ENV CLASSPATH /usr/local/java/jdk/lib:/usr/local/java/jdk/jre/lib
ENV MAVEN_HOME /usr/local/maven
ENV JENKINS_HOME /data/jenkins/jenkins-data
ENV NODE_HOME /usr/local/node
ENV NODE_PATH /usr/local/node/lib/node_modules:$PATH
ENV PATH $PATH:/usr/local/java/jdk/bin:/usr/local/java/jdk/jre/bin:/usr/local/tomcat-8.0.39/bin:/usr/local/maven/bin:/usr/local/node/bin

WORKDIR /data/jenkins/jenkins-data
EXPOSE 8080
CMD ["java","-jar","/data/jenkins/jenkins-data/jenkins.war","--httpPort=8080"]

