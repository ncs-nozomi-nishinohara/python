FROM ncsnozominishinohara/python:3.6.8-gpu-ppc64le as opencv
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
    && rm -rf /var/lib/apt/lists/*

RUN set -x \
    && mkdir /work \
    && cd /work \
    && git clone -b 4.1.1 https://github.com/ncs-nozomi-nishinohara/opencv_contrib.git \
    && git clone -b 4.1.1 https://github.com/ncs-nozomi-nishinohara/opencv.git \
    && mkdir -p /work/opencv/build \
    && mkdir -p /work/opencv_contrib/build \
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
    .. \
    && make -j20 \
    && make install \
    && cd /work/opencv/build/python_loader \
    && python setup.py bdist_wheel \
    && cp /work/opencv/build/python_loader/dist/opencv-4.1.1-py3-none-any.whl /work/opencv-4.1.1-py3-none-any.whl
