FROM jenkins/jenkins:lts

USER root
RUN apt-get update -qq \
  && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/debian \
  $(lsb_release -cs) \
  stable"
RUN apt-get update  -qq \
  && apt-get install docker-ce -y
RUN usermod -aG docker jenkins

RUN apt-get update && \
  apt-get install -y maven
ENV MAVEN_HOME /usr/share/maven
ENV PATH $MAVEN_HOME/bin:$PATH

# # Install Node.js and npm
# RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs
