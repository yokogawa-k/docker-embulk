FROM java:9
MAINTAINER Y-Fujikawa "fujikawa0@gmail.com"

# RUN apt-get -y update && apt-get -y upgrade
RUN curl --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar" && \
    chmod +x ~/.embulk/bin/embulk
RUN echo 'export PATH="$HOME/.embulk/bin:$PATH"' >> ~/.bashrc
RUN . ~/.bashrc