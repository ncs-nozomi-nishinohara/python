FROM ncsnozominishinohara/python:conda3-base-ppc64le

ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

LABEL maintainer="nozomi ishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY bashrc /root/.bashrc
COPY wait-for-it.sh /usr/bin/

RUN mkdir -p /usr/app/src \
    && chmod +x /usr/bin/wait-for-it.sh


# minicondaのインストール
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y wget netcat lftp git \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-ppc64le.sh -O miniconda.sh \
    && chmod +x miniconda.sh \
    && bash miniconda.sh -b -p /root/miniconda

ENV PATH="/root/miniconda/bin:$PATH"

# condaコマンドの実行
RUN conda config --set always_yes yes \
    && conda info -a \
    && conda install conda-build

# opencvの入手/ビルド
RUN mkdir -p /usr/work
WORKDIR /usr/work
RUN set -x \
    && git clone https://github.com/ncs-nozomi-nishinohara/opencv.git -b 4.1.1 \
    && cd opencv \
    && git checkout -b 4.1.1 \
    && git clone https://github.com/ncs-nozomi-nishinohara/opencv_contrib.git -b 4.1.1 \
    && cd opencv_contrib \
    && git checkout -b 4.1.1 \
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