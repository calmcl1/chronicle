#!/bin/bash

# One for each output
rm -rf chronicle-v1.0.0-x32
mkdir chronicle-v1.0.0-x32

cd chronicle-v1.0.0-x32
../configure --disable-shared --enable-static --host=i686-w64-mingw32 && make && make mostlyclean
deps=$(ldd ./chronicle.exe | awk '/~*mingw*/ {print $3}')
for dep in $deps
do
cp $dep .
done
cp ../LICENCE .
cp ../README.md .
cp ../CHANGELOG.md .
cd ..

tar zcf chronicle-v1.0.0-x32.tar.gz chronicle-v1.0.0-x32
