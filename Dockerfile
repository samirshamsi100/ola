FROM openshift/redhat-openjdk18-openshift:1.2

ENV JAVA_APP_JAR ola.jar
ENV AB_ENABLED off
ENV AB_JOLOKIA_AUTH_OPENSHIFT true
ENV JAVA_OPTIONS -Xmx256m -Djava.security.egd=file:///dev/./urandom
ENV MAVEN_HOME /opt/rh/rh-maven33/root/usr/share/maven
EXPOSE 8080

COPY pom.xml $HOME
COPY ./src $HOME
RUN $MAVEN_HOME/bin/mvn clean package -DskipTests -Dcom.redhat.xpaas.repo.redhatga -Dfabric8.skip=true
#RUN /usr/local/s2i/run

RUN cp target/ola.jar /deployments/
