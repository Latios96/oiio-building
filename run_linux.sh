#!/usr/bin/env bash
git clone https://github.com/OpenImageIO/oiio.git
cd oiio
git checkout Release-2.1.16.0
cd ..
ROOT=$PWD
oiio/src/build-scripts/build_pybind11.bash
export pybind11_ROOT=/$PWD/ext/dist
cd $ROOT
echo $PWD
./build_python.sh
