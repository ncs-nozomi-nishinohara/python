FROM ncsnozominishinohara/python:conda3-base-ppc64le

ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

LABEL maintainer="nozomi ishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY bashrc /root/.bashrc
COPY wait-for-it.sh /usr/bin/

RUN mkdir -p /usr/app/src \
    && chmod +x /usr/bin/wait-for-it.sh

# opencvの入手/ビルド
RUN mkdir -p /usr/work
WORKDIR /usr/work
RUN set -x \
    && git clone https://github.com/ncs-nozomi-nishinohara/opencv.git -b 4.1.1 \
    && cd opencv \
    && git checkout -b 4.1.1 \
    && cd ../ \
    && git clone https://github.com/ncs-nozomi-nishinohara/opencv_contrib.git -b 4.1.1 \
    && cd opencv_contrib \
    && git checkout -b 4.1.1 \
    && cd ../
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends cmake \
    git \
    libgtk2.0-dev \
    pkg-config \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    python-dev \
    python-numpy \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libdc1394-22-dev \
    && cd opencv \
    && mkdir build \
    && cd build/


WORKDIR /usr/app/src

CMD [ "bash" ]