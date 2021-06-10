#!/usr/bin/env bash


rm -rf build
mkdir build
cp conanfile.txt build/conanfile.txt
cd buildpy 
conan install .



