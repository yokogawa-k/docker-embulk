FROM java:8
MAINTAINER Y-Fujikawa "fujikawa0@gmail.com"

ENV EMBULK_VERSION 0.9.9
RUN curl -L https://bintray.com/artifact/download/embulk/maven/embulk-${EMBULK_VERSION}.jar -o /opt/embulk.jar

WORKDIR /work
ENTRYPOINT ["java", "-jar", "/opt/embulk.jar"]
CMD ["--help"]
