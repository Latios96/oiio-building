#!/usr/bin/env bash


rm -rf build
mkdir build
cp conanfile.txt build/conanfile.txt
cd build
conan install . --build missing



