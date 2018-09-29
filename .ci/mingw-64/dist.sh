cd ${CHRONICLE_TRIPLET}
make mostlyclean
deps=`x86_64-w64-mingw32-objdump -p chronicle.exe | grep dll | awk '{print $3}'`
for dep in ${deps}
do
    echo "Looking for ${dep}..."
    dep_file=`find /usr -name ${dep} | grep -m 1 .dll`
    if [ -e ${dep_file} ] && [ ! -z ${dep_file} ]
    then
        echo "Copying ${dep_file} to $PWD"
        cp ${dep_file} .
    else
        echo "Couldn't find it, moving on"
    fi
done
cp ../LICENCE .
cp ../README.md .
cp ../CHANGELOG.md .
cd ..
tar zcf ${CHRONICLE_TRIPLET}.tar.gz ${CHRONICLE_TRIPLET}