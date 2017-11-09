FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install default-jdk wget unzip git

RUN wget --no-check-certificate https://services.gradle.org/distributions/gradle-3.4.1-bin.zip

RUN mkdir /opt/gradle
RUN unzip -d /opt/gradle gradle-3.4.1-bin.zip

WORKDIR "/usr/bin"
RUN ln -s /opt/gradle/gradle-3.4.1/bin/gradle
