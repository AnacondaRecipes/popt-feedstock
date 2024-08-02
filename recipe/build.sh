#!/bin/sh

set -e -o pipefail

#./autogen.sh will run configure unless you tell it not to.
export NOCONFIGURE=1
./autogen.sh
./configure --prefix=$PREFIX
make
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
  make check
fi
make install
