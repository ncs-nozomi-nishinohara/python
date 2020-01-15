FROM debian

ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'
ENV PATH="$HOME/miniconda/bin:$PATH"

LABEL maintainer="nozomi ishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY bashrc /root/.bashrc
COPY wait-for-it.sh /usr/bin/

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y wget netcat lftp \
    && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-ppc64le.sh -O miniconda.sh \
    && chmod +x miniconda.sh \
    && bash miniconda.sh -b -p $HOME/miniconda \
    && conda config --set always_yes yes \
    && conda info -a \
    && conda install conda-build \
    && mkdir -p /usr/app/src \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /usr/bin/wait-for-it.sh

WORKDIR /usr/app/src

CMD [ "bash" ]