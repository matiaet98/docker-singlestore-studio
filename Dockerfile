FROM ubuntu:22.04

RUN apt update

RUN apt install --no-install-recommends -y wget gnupg ca-certificates apt-utils && \
    wget -O - --no-check-certificate 'https://release.memsql.com/release-aug2018.gpg'  2>/dev/null | apt-key add - && apt-key list && \
    echo "deb [arch=amd64] https://release.memsql.com/production/debian memsql main" | tee /etc/apt/sources.list.d/memsql.list

RUN apt update && \
    apt -y install singlestoredb-studio

EXPOSE 8080

CMD ["memsql-studio"]