wget https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.gz
tar xf boost_1_68_0.tar.gz
cd boost_1_68_0
echo "using gcc : : x86_64-w64-mingw32-gcc ;" > user-config.jam
./bootstrap.sh --with-libraries=system,filesystem --prefix=/usr/local #--prefix=/usr/x86_64-w64-mingw32