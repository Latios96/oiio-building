#!/usr/bin/env bash
git clone https://github.com/OpenImageIO/oiio.git
cd oiio
git checkout Release-2.2.11.1
cd ..
#ROOT=$PWD
#oiio/src/build-scripts/build_pybind11.bash
#export pybind11_ROOT=/$PWD/ext/dist
#cd $ROOT
#echo $PWD
./oiio/src/build-scripts/gh-installdeps.bash
./build_python.sh
