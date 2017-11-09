FROM openjdk:8-jdk-alpine

ENV GRADLE_HOME /opt/gradle
ENV GRADLE_VERSION 4.3

ARG GRADLE_DOWNLOAD_SHA256=8dcbf44eef92575b475dcb1ce12b5f19d38dc79e84c662670248dc8b8247654c
RUN set -o errexit -o nounset \
        && echo "Installing build dependencies" \
        && apk add --no-cache --virtual .build-deps \
                ca-certificates \
                openssl \
                unzip \
        \
        && echo "Downloading Gradle" \
        && wget -O gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
        \
        && echo "Checking download hash" \
        && echo "${GRADLE_DOWNLOAD_SHA256} *gradle.zip" | sha256sum -c - \
        \
        && echo "Installing Gradle" \
        && unzip gradle.zip \
        && rm gradle.zip \
        && mkdir /opt \
        && mv "gradle-${GRADLE_VERSION}" "${GRADLE_HOME}/" \
        && ln -s "${GRADLE_HOME}/bin/gradle" /usr/bin/gradle \
        \
        && apk del .build-deps