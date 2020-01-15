cmake -DWITH_JPEG=ON -DWITH_OPENCL=OFF \
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
-DCMAKE_INSTALL_PREFIX=/usr/local ..

cmake -DWITH_JPEG=ON -DWITH_OPENCL=OFF \
-DWITH_OPENMP=OFF -DWITH_PTHREADS_PF=OFF \
-DWITH_CUDA=OFF \
-DCMAKE_C_FLAGS="-mcpu=power9 -mtune=power9" -DCMAKE_CXX_FLAGS="-mcpu=power9 -mtune=power9" \
-DCMAKE_VERBOSE_MAKEFILE=ON \
-DCMAKE_C_COMPILER=$(which gcc) -DCMAKE_CXX_COMPILER=$(which g++) \
-DPYTHON3_EXECUTABLE=$(which python3) \
-DPYTHON3_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
-DPYTHON3_LIBRARY=$(python3 -c "from distutils.sysconfig import get_config_var;from os.path import dirname,join ; print(join(dirname(get_config_var('LIBPC')),get_config_var('LDLIBRARY')))") \
-DPYTHON3_NUMPY_INCLUDE_DIRS=$(python3 -c "import numpy; print(numpy.get_include())") \
-DPYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
-DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr/local ..
