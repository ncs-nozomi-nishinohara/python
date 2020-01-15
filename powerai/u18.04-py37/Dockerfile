FROM ibmcom/powerai:1.6.2-tensorflow-cpu-ubuntu18.04-py37 as opencv
USER root
RUN set -x \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    wget \
    netcat \
    git \
    cmake \
    make \
    gcc \
    g++ \
    python3-numpy \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /work \
    && cd /work \
    && git clone -b 4.1.1 https://github.com/ncs-nozomi-nishinohara/opencv_contrib.git \
    && git clone -b 4.1.1 https://github.com/ncs-nozomi-nishinohara/opencv.git \
    && mkdir -p opencv/build \
    && mkdir -p opencv_contrib/build \
    && cd /work/opencv/build \
    && cmake -DWITH_JPEG=ON \
    -DWITH_OPENCL=OFF \
    -DWITH_OPENMP=OFF \
    -DWITH_PTHREADS_PF=OFF \
    -DWITH_CUDA=OFF \
    -DCMAKE_C_FLAGS="-mcpu=power9 -mtune=power9" \
    -DCMAKE_CXX_FLAGS="-mcpu=power9 -mtune=power9" \
    -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_C_COMPILER=$(which gcc) \
    -DCMAKE_CXX_COMPILER=$(which g++) \
    -DPYTHON3_EXECUTABLE=$(which python3) \
    -DPYTHON3_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
    -DPYTHON3_LIBRARY=$(python3 -c "from distutils.sysconfig import get_config_var;from os.path import dirname,join ; print(join(dirname(get_config_var('LIBPC')),get_config_var('LDLIBRARY')))") \
    -DPYTHON3_NUMPY_INCLUDE_DIRS=$(python3 -c "import numpy; print(numpy.get_include())") \
    -DPYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    -DCMAKE_BUILD_TYPE=Release \
    ..

FROM ibmcom/powerai:1.6.2-tensorflow-cpu-ubuntu18.04-py37
ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

USER root

LABEL maintainer="nozomi ishinohara < nozomi_nishinohara@n-creativesystem.com>"

RUN mkdir -p /work/opencv/build /work/opencv_contrib/build

COPY --from=opencv /work/opencv/build /work/opencv/build
COPY --from=opencv /work/opencv_contrib/build /work/opencv_contrib/build
COPY bashrc /root/.bashrc
COPY wait-for-it.sh /usr/bin/

RUN set -x \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y  --no-install-recommends \
    wget \
    netcat \
    make \
    cmake \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /usr/app/src \
    && chmod -R 755 /usr/app/src \
    && chown -R pwrai /usr/app/src \ 
    && cd /work/opencv/build \
    && make -j20 \
    && make install

WORKDIR /usr/app/src
