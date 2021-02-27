function buildCpp {
	conan install .. --build missing
	cmake \
		-DUSE_PYTHON=1 \
		-DPYTHON_VERSION=3.8 \
		-DUSE_EXTERNAL_PUGIXML=1 \
		-DOIIO_BUILD_TESTS=0 \
		-DOIIO_BUILD_TOOLS=0 \
		-DBUILD_SHARED_LIBS=0 \
		-DSTOP_ON_WARNING=OFF \
		-DENABLE_WebP=0 \
		-DENABLE_FFmpeg=0 \
		../oiio
	make -j 16	
}

function buildWheel {
	mkdir pythonwheel
	cp ../wheel-src/setup.py pythonwheel/setup.py
	cp -r lib pythonwheel/oiio
	mv pythonwheel/lib pythonwheel/oiio
	touch pythonwheel/oiio/__init__.py
	cd pythonwheel
	python3 setup.py bdist_wheel --python-tag=cp3.8 --plat-name=linux_x86_64
}

rm -rf buildpy
mkdir buildpy 
cd buildpy 
buildCpp
buildWheel



