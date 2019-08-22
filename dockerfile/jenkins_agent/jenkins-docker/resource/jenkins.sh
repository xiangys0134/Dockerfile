#!/bin/sh -e
java -jar /usr/bin/agent.jar -jnlpUrl ${JENKINS_URL} -secret ${JENKINS_SECRET} -workDir ${JENKINS_AGENT_WORKDIR} && sh /usr/local/bin/docker-entrypoint.sh
