#!/bin/bash
cd libsndfile-1.0.28
./configure --host=x86_64-w64-mingw32 --disable-static --prefix=/usr/x86_64-w64-mingw32
make
make install