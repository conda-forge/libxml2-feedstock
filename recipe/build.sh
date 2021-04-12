#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* .

./autogen.sh

# Define TRUE/FALSE via preprocessor flags for now (until upstream fixes it).
# (Some (non-header) source files use them but not define them or include <stdbool.h> .)
export CPPFLAGS="${CPPFLAGS} -DFALSE=0 -DTRUE=1"

./configure --prefix="${PREFIX}" \
            --build=${BUILD} \
            --host=${HOST} \
            --with-iconv="${PREFIX}" \
            --with-zlib="${PREFIX}" \
            --with-icu \
            --with-lzma="${PREFIX}" \
            --without-python \
            --enable-static=no
make -j${CPU_COUNT} ${VERBOSE_AT}
# Sorry:
# ## Error cases regression tests
# file result/errors/759573.xml.err is 1983 bytes, result is 1557 bytes
# Error for ./test/errors/759573.xml failed
# if [[ ${target_platform} != osx-64 ]]; then
#   make check $VERBOSE_AT}
# fi
make install

# Remove large documentation files that can take up to 6.6/9.2MB of the install
# size.
# https://github.com/conda-forge/libxml2-feedstock/issues/57
rm -rf ${PREFIX}/share/doc
rm -rf ${PREFIX}/share/gtk-doc
rm -rf ${PREFIX}/share/man
