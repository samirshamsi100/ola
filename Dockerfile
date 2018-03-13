FROM openshift/redhat-openjdk18-openshift:1.2

ENV JAVA_APP_JAR ola.jar
ENV AB_ENABLED off
ENV AB_JOLOKIA_AUTH_OPENSHIFT true
ENV JAVA_OPTIONS -Xmx256m -Djava.security.egd=file:///dev/./urandom
ENV MAVEN_HOME /opt/rh/rh-maven33/root/usr/share/maven

EXPOSE 8080

USER 1001

RUN $MAVEN_HOME/bin/mvn package

ADD target/ola.jar /deployments/
