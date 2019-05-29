#! /bin/bash -e

git config --global user.email "you@example.com"
git config --global user.name "Your Name"
java -jar /usr/bin/agent.jar -jnlpUrl ${JENKINS_URL} -secret ${JENKINS_SECRET} -workDir ${JENKINS_AGENT_WORKDIR}
