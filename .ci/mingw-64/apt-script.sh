#!/bin/bash
chmod +x .ci/mingw-64//*.sh
apt-get update -qq
apt-get install mingw-w64 mingw-w64-tools pkg-config git libtool libtool-bin build-essential wget autoconf automake python -qq -y
update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix
update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix