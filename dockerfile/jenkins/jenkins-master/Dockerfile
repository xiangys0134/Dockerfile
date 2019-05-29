FROM alpine:3.9
# 镜像的作者 
LABEL maintainer="<250919938@qq.com>" 
  
COPY resource /tmp/resource
### SET ENVIRONNEMENT
ARG http_port=8080
ARG agent_port=50000
ARG jenkins_version=2.164.3
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    TIME_ZONE=Asia/Shanghai \
    JENKINS_HOME=/data/jenkins_home \
    JENKINS_BACKUP=/data/jenkins_backup \
    JENKINS_HTTP_PORT=${http_port} \
    JENKINS_SLAVE_AGENT_PORT=${agent_port} \
    JENKINS_VERSION=${jenkins_version} 
# Install language pack
RUN apk --no-cache add ca-certificates wget curl tzdata vim openjdk8 git openssh-client curl unzip bash ttf-dejavu coreutils tini && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    cd /tmp/resource && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-bin-2.25-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-i18n-2.25-r0.apk && \
    apk add glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk glibc-2.25-r0.apk && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    mkdir -p /usr/share/jenkins/ref/init.groovy.d && mkdir -p "$JENKINS_HOME" && mkdir -p "${JENKINS_BACKUP}" &&  mkdir -p /usr/share/jenkins/ref && \
    JENKINS_URL=https://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war && \
    curl -fsSL ${JENKINS_URL} -o /usr/share/jenkins/jenkins.war && \
    cp -r /tmp/resource/jenkins.sh /usr/local/bin/jenkins.sh && \
    cp -r /tmp/resource/plugins.sh /usr/local/bin/plugins.sh && \
    cp -r /tmp/resource/jenkins-support /usr/local/bin/jenkins-support && \
    cp -r /tmp/resource/install-plugins.sh /usr/local/bin/install-plugins.sh && \
    chmod +x /usr/local/bin/*.sh && rm -fr /tmp/resource

WORKDIR ${JENKINS_HOME}
EXPOSE ${http_port}/tcp ${agent_port}/tcp

VOLUME ["$JENKINS_HOME","${JENKINS_BACKUP}"]

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
