#! /bin/bash -e
java -jar /usr/bin/agent.jar -jnlpUrl ${JENKINS_URL} -secret ${JENKINS_SECRET} -workDir ${JENKINS_AGENT_WORKDIR}
