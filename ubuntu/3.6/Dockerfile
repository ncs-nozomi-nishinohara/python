FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

LABEL maintainer="nozomi nishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY bashrc /root/.bashrc
COPY wait-for-it.sh /usr/bin/
COPY docker-entrypoint.sh /usr/bin/

RUN apt-get update \
    && apt-get install -y python3-pip python3-dev \
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip \
    && apt-get install -y python3-numpy python3-scipy netcat \
    && mkdir -p /usr/app/src \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR /usr/app/src

CMD [ "python" ]