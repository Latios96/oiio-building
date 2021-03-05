#!/usr/bin/env bash
function buildCpp {
	conan install .. --build missing
  python3 ../call_cmake.py
	make -j 16 VERBOSE=1
}

function buildWheel {
	mkdir pythonwheel
	cp ../wheel-src/setup.py pythonwheel/setup.py
	cp -r lib pythonwheel/oiio
	touch pythonwheel/oiio/__init__.py
	cd pythonwheel
	if [[ "$OSTYPE" == "darwin"* ]]; then
	  python3 setup.py bdist_wheel --python-tag=cp38 --plat-name=linux_x86_64
	fi
	if [[ "$OSTYPE" == "darwin"* ]]; then
	  python3 setup.py bdist_wheel --python-tag=cp38 --plat-name=macosx-11.1-x86_64
	fi
}

rm -rf buildpy
mkdir buildpy 
cd buildpy 
buildCpp
buildWheel



