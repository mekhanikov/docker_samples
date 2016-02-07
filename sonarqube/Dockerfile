FROM ubuntu

RUN DEBIAN_FRONTEND=noninteractive apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes -qq python-software-properties software-properties-common

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer




# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install curl unzip

ENV SONARQUBE_HOME /opt/sonarqube

# Http port
EXPOSE 9000

# Database configuration
# Defaults to using H2
ENV SONARQUBE_JDBC_USERNAME root
ENV SONARQUBE_JDBC_PASSWORD 1
ENV SONARQUBE_JDBC_URL jdbc:mysql:tcp://emekhanikov_mysql56:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true
#jdbc:mysql://localhost:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true

ENV SONAR_VERSION 5.3

# pub   2048R/D26468DE 2015-05-25
#       Key fingerprint = F118 2E81 C792 9289 21DB  CAB4 CFCA 4A29 D264 68DE
# uid                  sonarsource_deployer (Sonarsource Deployer) <infra@sonarsource.com>
# sub   2048R/06855C1D 2015-05-25
#RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys F1182E81C792928921DBCAB4CFCA4A29D26468DE

WORKDIR /opt
COPY sonarqube-5.3.zip /opt/
RUN unzip sonarqube-5.3.zip \
	&& mv sonarqube-5.3 sonarqube \
	&& rm sonarqube-5.3.zip

VOLUME ["$SONARQUBE_HOME/data", "$SONARQUBE_HOME/extensions"]

WORKDIR $SONARQUBE_HOME
#COPY run.sh /opt/sonarqube/bin/
COPY sonar.properties /opt/sonarqube/conf/
ENTRYPOINT /opt/sonarqube/bin/linux-x86-64/sonar.sh start && tail -f /opt/sonarqube/logs/sonar.log
