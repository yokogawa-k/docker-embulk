FROM java:8

ENV DIGDAG_VERSION=0.9.31

RUN apt-get -y update && apt-get -y upgrade

# Digdagのデーモン化に使う
RUN apt-get -y install supervisor

# DigdagとEmbulkをインストール
RUN curl -o /usr/local/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-${DIGDAG_VERSION}" && \
    chmod +x /usr/local/bin/digdag && \
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc && \
    adduser --shell /sbin/nologin --disabled-password --gecos "" digdag && \
    mkdir -p /var/lib/digdag/logs/tasks /var/lib/digdag/logs/server && \
    curl --create-dirs -o /usr/local/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar" && \
    chmod +x /usr/local/bin/embulk && \
    echo 'export PATH="$HOME/.embulk/bin:$PATH"' >> ~/.bashrc

# Digdagのプロジェクトを設置
RUN mkdir /project

# Digdagの設定ファイル設置
ADD ./conf/postgresql.conf /etc/postgresql.conf
RUN chmod +x /etc/postgresql.conf

RUN . ~/.bashrc

# Embulkのプラグインをインストール
# RUN embulk gem install \
#     embulk-input-postgresql \
#     embulk-output-bigquery

EXPOSE 65432

# SupervisorでDigdagをデーモン化
RUN touch /etc/supervisord.conf
RUN echo '[supervisord]' >> /etc/supervisord.conf
RUN echo 'nodaemon=true' >> /etc/supervisord.conf
RUN echo '[include]' >> /etc/supervisord.conf
RUN echo 'files = /etc/supervisor/conf.d/*.conf' >> /etc/supervisord.conf

ADD ./conf/digdag.conf /etc/supervisor/conf.d/
ADD ./shell/exec-digdag.sh /usr/local/bin/exec-digdag.sh
RUN chmod +x /usr/local/bin/exec-digdag.sh

CMD /usr/bin/supervisord -c /etc/supervisord.conf
