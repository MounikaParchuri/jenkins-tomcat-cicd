FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get -y upgrade
#RUN add-apt-repository ppa:openjdk-r/ppa
#RUN apt-get update
RUN apt-get -y install openjdk-11-jdk wget
RUN apt-get -y install curl
RUN mkdir /usr/local/tomcat
WORKDIR /usr/local/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.20/bin/apache-tomcat-10.1.20.tar.gz /usr/local/tomcat
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-10.1.20/* /usr/local/tomcat
EXPOSE 8080
# java
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# Define default command.
CMD ["bash"]

#MAINTAINER bhaskarndas@gmail.com


WORKDIR /usr/local/tomcat/webapps
RUN curl -O -L https://github.com/bhaskarndas/sample-war/raw/main/sampletest.war


CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
