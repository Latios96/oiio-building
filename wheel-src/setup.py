# Prefer setuptools over distutils
from setuptools import setup
from setuptools import find_packages

setup(
    name="oiio",
    version="2.2.11.1",
    description="OpenImageIO Python binaries",
    url="https://github.com/Latios96/oiio-building",

    # https://pypi.org/classifiers/
    classifiers=[
        "Programming Language :: Python :: PYTHON_VERSION",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS_NAME",
    ],
    packages=find_packages(exclude=[]),
    package_data={
        # If any package (!) contains ... files, include them:
        "": [
            "*.pyd",
            "*.dll",
            "*.so",
        ]
    },
)
