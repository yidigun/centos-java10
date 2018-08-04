FROM centos:latest
MAINTAINER dklee@yidigun.com

ENV JAVA_VERSION_MAJOR 10
ENV JAVA_VERSION_MINOR 2
ENV JAVA_VERSION_BUILD 13
ENV JAVA_URL_HASH 19aef61b38124481863b1413dce1855f

RUN yum -y install libX11 libXext libXi libXrender libXtst alsa-lib && \
    mkdir /opt/oracle && \
    curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" \
      "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}.0.${JAVA_VERSION_MINOR}+${JAVA_VERSION_BUILD}/${JAVA_URL_HASH}/serverjre-${JAVA_VERSION_MAJOR}.0.${JAVA_VERSION_MINOR}_linux-x64_bin.tar.gz" | \
        tar zxf - -C /opt/oracle && \
    ln -s jdk-${JAVA_VERSION_MAJOR}.0.${JAVA_VERSION_MINOR} /opt/oracle/java && \
    yum -y clean all && \
    rm -rf /var/cache/yum

ENV JAVA_HOME /opt/oracle/java
ENV PATH ${PATH}:${JAVA_HOME}/bin
