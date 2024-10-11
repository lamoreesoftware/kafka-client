FROM alpine:3.20.3
ARG SCALA_VERSION="2.13"
ARG KAFKA_VERSION="3.8.0"

RUN apk --update --no-cache add openjdk17-jre curl && \
  curl -s -o "/tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" "https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
  tar -zxf "/tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" -C /opt && \
  rm -f "/tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"

ENV JAVA_HOME="/usr/lib/jvm/default-jvm"
ENV KAFKA_HOME="/opt/apache-ant-1.9.8"
ENV PATH="${PATH}:${JAVA_HOME}/bin"

WORKDIR "/opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}"

ENTRYPOINT [ "/bin/sh" ]
