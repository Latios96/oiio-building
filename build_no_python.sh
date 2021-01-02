rm -rf build
mkdir build 
cd build 
conan install .. --build missing
cmake -DUSE_PYTHON=0 -DOIIO_BUILD_TESTS=0 ..
make -j 16
