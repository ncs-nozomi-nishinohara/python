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
    && apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
    && python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev \
    && cd opencv \
    && mkdir build \
    && cd build/ \
    && cmake -DWITH_JPEG=ON -DWITH_OPENCL=OFF \
    -DWITH_OPENMP=OFF -DWITH_PTHREADS_PF=OFF \
    -DWITH_CUDA=OFF \
    -DCMAKE_C_FLAGS="-mcpu=power9 -mtune=power9" -DCMAKE_CXX_FLAGS="-mcpu=power9 -mtune=power9" \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_C_COMPILER=$(which gcc) -DCMAKE_CXX_COMPILER=$(which g++) \
    -DPYTHON_EXECUTABLE=$(which python) \
    -DPYTHON_INCLUDE_DIR=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
    -DPYTHON_LIBRARY=$(python -c "from distutils.sysconfig import get_config_var;from os.path import dirname,join ; print(join(dirname(get_config_var('LIBPC')),get_config_var('LDLIBRARY')))") \
    -DPYTHON_NUMPY_INCLUDE_DIRS=$(python -c "import numpy; print(numpy.get_include())") \
    -DPYTHON_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local .. \
    && make -j8 2>&1 |tee make.log \
    && make install \
    && ldconfig

WORKDIR /usr/app/src

CMD [ "bash" ]