FROM java:7
MAINTAINER Kazuya Yokogawa "yokogawa-k@klab.ocm"

ENV DEBIAN_FRONTEND noninteractive
RUN curl -L https://bintray.com/artifact/download/embulk/maven/embulk-0.2.0.jar -o /opt/embulk.jar

WORKDIR /work
ENTRYPOINT ["java", "-jar", "/opt/embulk.jar"]
CMD ["--help"]



