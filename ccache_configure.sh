#!/usr/bin/env bash

# First, install ccache binary in ~/bin/ccache, following the helper msg.
# Then, rm -rf current ccache directory.

# Check ccache is there.
bin_dr=$HOME/bin
ccache_bin=${bin_dr}/ccache
if [ -e ${ccache_bin} ]; then
    echo "Found: ccache at ${ccache_bin}."
else
    echo "Cannot find ccache at ${ccache_bin}, please build and install manually."
    echo "[Steps]
git clone https://github.com/ccache/ccache.git
cd ccache
git checkout v4.2 -b 4.2
build
cmake -DCMAKE_INSTALL_PREFIX=$HOME -DCMAKE_BUILD_TYPE=Release -DZSTD_FROM_INTERNET=ON ..
make -j
make install
Finally, remember to rm -rf the previous ccache directory.
"
    exit 1
fi

# Create symbolic links.
pushd ${bin_dr}
compilers=(
    c++
    c89-gcc
    c99-gcc
    cc
    g++
    g++-5
    g++-7
    g++-8
    g++-9
    g++-10
    g++-11
    g++-12
    gcc
    gcc-5
    gcc-7
    gcc-8
    gcc-9
    gcc-10
    gcc-11
    gcc-12
    x86_64-linux-gnu-g++
    x86_64-linux-gnu-g++-5
    x86_64-linux-gnu-g++-6
    x86_64-linux-gnu-g++-7
    x86_64-linux-gnu-g++-8
    x86_64-linux-gnu-g++-9
    x86_64-linux-gnu-g++-10
    x86_64-linux-gnu-g++-11
    x86_64-linux-gnu-g++-12
    x86_64-linux-gnu-gcc
    x86_64-linux-gnu-gcc-5
    x86_64-linux-gnu-gcc-6
    x86_64-linux-gnu-gcc-7
    x86_64-linux-gnu-gcc-8
    x86_64-linux-gnu-gcc-9
    x86_64-linux-gnu-gcc-10
    x86_64-linux-gnu-gcc-11
    x86_64-linux-gnu-gcc-12
    clang
    clang-6
    clang-7
    clang-8
    clang-9
    clang-10
    clang++
    clang++-6
    clang++-7
    clang++-8
    clang++-9
    clang++-10
)
for compiler in "${compilers[@]}"; do
    echo "===================="
    echo "[${compiler}]"
    if [ -e ${bin_dr}/${compiler} ]; then
        rm ${bin_dr}/${compiler}
        echo "Removed: ${bin_dr}/${compiler}"
    fi
    if command -v ${compiler} &>/dev/null; then
        # Previous location
        location=$(which ${compiler})
        echo "which ${compiler}: ${location}"
        # Link
        ln -s ccache ${bin_dr}/${compiler}
        echo "Created: ${bin_dr}/${compiler}"
        # Print current location
        location=$(which ${compiler})
        echo "which ${compiler}: ${location}"
    fi
done
popd
