FROM --platform=$BUILDPLATFORM tensorflow/tensorflow:2.1.0-gpu-py3

ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

LABEL maintainer="nozomi ishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY bashrc /root/.bashrc
COPY wait-for-it.sh /usr/bin/
COPY docker-entrypoint.sh /usr/bin/

RUN set -x \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends netcat \
    && mkdir -p /usr/app/src \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /usr/bin/wait-for-it.sh \
    && chmod +x /usr/bin/docker-entrypoint.sh

WORKDIR /usr/app/src

ENTRYPOINT [ "docker-entrypoint.sh" ]