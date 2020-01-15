
FROM ncsnozominishinohara/python:3.6.8-gpu-ppc64le
ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

LABEL maintainer="nozomi ishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY --from=opencv /usr/app/src/opencv-4.1.1-py3-none-any.whl /work/opencv-4.1.1-py3-none-any.whl
RUN pip install /usr/app/src/opencv-4.1.1-py3-none-any.whl
COPY bashrc /root/.bashrc
COPY wait-for-it.sh /usr/bin/

RUN set -x \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y  --no-install-recommends \
    netcat \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /home/pwrai/app

WORKDIR /usr/app
