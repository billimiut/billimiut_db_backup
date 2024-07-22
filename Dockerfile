FROM mongo:latest

RUN apt-get update && apt-get install -y \
    awscli \
    && rm -rf /var/lib/apt/lists/*

COPY backup.sh /backup.sh

ENTRYPOINT [ "/backup.sh" ]