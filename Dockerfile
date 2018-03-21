FROM mongo:3.4

RUN apt-get update && \
  apt-get install -y lsb-release

RUN echo deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli $(lsb_release -cs) main >> /etc/apt/sources.list.d/azure-cli.list

RUN apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893

RUN apt-get install -y apt-transport-https

RUN apt-get update && \
  apt-get install azure-cli && \
  apt-get install -y cron

WORKDIR /src

COPY ./scripts /src

RUN chmod +x /src/dump.sh
RUN chmod +x /src/upload.sh

VOLUME /backup/
VOLUME /var/log/

CMD ["./start.sh"]