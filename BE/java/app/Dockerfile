ARG JAVA_VERSION=8
FROM openjdk:${JAVA_VERSION}-alpine

### use chinese proxy
ARG USE_CHINA_PROXY=False
RUN if [ ${USE_CHINA_PROXY} = True ]; then \
   sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
;fi

### install base lib
RUN  apk update \
       && apk add  git openssh curl wget tar unzip \
        gcc g++ autoconf make  libstdc++

### install maven
ARG INSTALL_MAVEN=False
ARG MAVEN_VERSION=3.6.3
RUN if [ ${INSTALL_MAVEN} = True ]; then \
    cd /opt  \
    && curl -sSl http://mirror.vorboss.net/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip > maven.zip  \
    && unzip maven.zip \
    && rm maven.zip \
;fi

### install gradle
ARG INSTALL_GRADLE=False
ARG GRADLE_VERSION=3.2
RUN if [ ${INSTALL_GRADLE} = True ]; then \
    cd opt \
    && curl https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip > gradle.zip \
    && unzip gradle.zip \
    && rm gradle.zip \
;fi

ENV MAVEN_HOME=/opt/apache-maven-${MAVEN_VERSION}
ENV GRADLE_HOME=/opt/gradle-${GRADLE_VERSION}
ENV PATH=$PATH:${MAVEN_HOME}/bin:${GRADLE_HOME}/bin

# clean cache
RUN rm /var/cache/apk/*
WORKDIR /var/www
