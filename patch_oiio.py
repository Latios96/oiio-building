def patch_file(path, replacements):
    print("Patching {} with {}".format(path, replacements))
    with open(path, "r") as f:
        content = f.read()

    for key, value in replacements.items():
        content = content.replace(key, value)

    with open(path, "w") as f:
        f.write(content)


if __name__ == '__main__':
    patch_file('oiio/src/cmake/externalpackages.cmake',
               {'checked_find_package (OpenEXR REQUIRED': 'find_package (OpenEXR REQUIRED'})
    patch_file('oiio/src/build-scripts/build_pybind11.bash',
               {'PYBIND11_VERSION=${PYBIND11_VERSION:=v2.5.0}': 'PYBIND11_VERSION=${PYBIND11_VERSION:=v2.6.2}'})
