FROM python:3.7.4

ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

LABEL maintainer="nozomi ishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY bashrc /root/.bashrc
COPY wait-for-it.sh /usr/bin/
COPY docker-entrypoint.sh /usr/bin/
COPY --from=ncsnozominishinohara/python:opencv-ppc64le /usr/lib/python3/dist-packages/cv2 /usr/lib/python3/dist-packages/cv2
COPY --from=ncsnozominishinohara/python:opencv-ppc64le /usr/local/lib/*4.1.1 /usr/local/lib/

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

ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR /usr/app/src

ONBUILD COPY requirements.txt requirements.txt

ONBUILD COPY . .
