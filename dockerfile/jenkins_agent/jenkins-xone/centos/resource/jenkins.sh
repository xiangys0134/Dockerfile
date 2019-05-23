#! /bin/bash

if [ -d ${JENKINS_AGENT_WORKDIR}/build ]; then
    find ${JENKINS_AGENT_WORKDIR}/build -name "*.sh" -o -name "*.py"|xargs -I {} chmod +x {}
    chown -R ${JENKINS_USER:-jenkins}. ${JENKINS_AGENT_WORKDIR}/build
fi
su - ${JENKINS_USER:-jenkins} -c "java -jar /usr/bin/agent.jar -jnlpUrl ${JENKINS_URL} -secret ${JENKINS_SECRET} -workDir ${JENKINS_AGENT_WORKDIR}"
