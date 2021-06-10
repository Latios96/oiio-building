#!/usr/bin/env bash
function buildCpp {
	conan install .. --build missing
  python3 ../call_cmake.py
	make -j 16
}

function buildWheel {
	mkdir pythonwheel
	cp ../wheel-src/setup.py pythonwheel/setup.py
	cp -r lib pythonwheel/oiio
	touch pythonwheel/oiio/__init__.py
	cd pythonwheel
	if [[ "$OSTYPE" == "darwin"* ]]; then
	  python3 setup.py bdist_wheel --python-tag=cp37 --plat-name=macosx-11.1-x86_64
	  python3 setup.py bdist_wheel --python-tag=cp$OIIO_PYTHON_WHEEL_VERSION --plat-name=macosx-11.1-x86_64
	else
	  python3 setup.py bdist_wheel --python-tag=cp$OIIO_PYTHON_WHEEL_VERSION --plat-name=linux_x86_64
	fi
}

rm -rf buildpy
mkdir buildpy 
cd buildpy 
buildCpp
buildWheel



