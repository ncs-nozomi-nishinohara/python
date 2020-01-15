FROM ibmcom/tensorflow-ppc64le:1.14.0-gpu-py3
ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

LABEL maintainer="nozomi ishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY bashrc /root/.bashrc
COPY wait-for-it.sh /usr/bin/

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y wget netcat lftp git \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-ppc64le.sh -O miniconda.sh \
    && chmod +x miniconda.sh \
    && bash miniconda.sh -b -p /root/miniconda

ENV PATH="/root/miniconda/bin:$PATH"

RUN conda config --set always_yes yes \
    && conda info -a \
    && conda install conda-build \
    && conda install scipy scikit-learn \
    && mkdir -p /usr/app/src \
    && chmod +x /usr/bin/wait-for-it.sh

WORKDIR /usr/app/src
