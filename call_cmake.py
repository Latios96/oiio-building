import subprocess
import json

if __name__ == '__main__':
    with open('conanbuildinfo.json', 'r') as f:
        data = json.load(f)
    dependencies = data['dependencies']
    openexr_dependency = [x for x in dependencies if x['name'] == 'openexr'][0]
    openexr_root = openexr_dependency['rootpath']
    cmake_command = ["cmake",
                     "-DUSE_PYTHON=1",
                     "-DPYTHON_VERSION=3.8",
                     "-DUSE_EXTERNAL_PUGIXML=1",
                     "-DOIIO_BUILD_TESTS=0",
                     "-DOIIO_BUILD_TOOLS=0",
                     "-DBUILD_SHARED_LIBS=0",
                     "-DSTOP_ON_WARNING=OFF",
                     "-DENABLE_WebP=0",
                     "-DENABLE_FFmpeg=0",
                     #"-DOpenEXR_DIR={}".format(openexr_root),
                     #"-DIlmBase_DIR={}".format(openexr_root),
                     #"-DImath_DIR_DIR={}".format(openexr_root),
                     "../oiio"]
    print(cmake_command)
    subprocess.call(cmake_command)
