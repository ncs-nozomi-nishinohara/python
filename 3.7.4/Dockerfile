FROM python:3.7.4

ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

LABEL maintainer="nozomi ishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY bashrc /root/.bashrc
COPY wait-for-it.sh /usr/bin/
COPY docker-entrypoint.sh /usr/bin/

RUN set -x \
    && mkdir -p /usr/app/src \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /usr/bin/wait-for-it.sh \
    && chmod +x /usr/bin/docker-entrypoint.sh \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \
    netcat \
    python3-numpy \
    python3-scipy

WORKDIR /usr/app/src

ENTRYPOINT [ "docker-entrypoint.sh" ]