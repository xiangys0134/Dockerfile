FROM docker:dind

COPY resource /tmp/resource
RUN apk add --no-cache git openssh-client openjdk8 &&\
    cp -r /tmp/resource/agent.jar /usr/bin/agent.jar && \
    cp -r /tmp/resource/jenkins.sh /usr/local/bin/jenkins.sh && \
    chmod +x /usr/bin/agent.jar && chmod +x /usr/local/bin/jenkins.sh && \
    cd ~  && rm -fr /tmp/resource
    
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
CMD ["sh"]
