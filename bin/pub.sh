#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version> "
        exit -1
fi



VERSION=$1
VERSION_CODE=${VERSION#./}
VERSION_CODE=${VERSION_CODE#+/}

bin/setver.sh $VERSION
bin/reldev.sh REL

flutter analyze lib
if [ $? -ne 0 ]; then
    echo "Error: analyze ./lib"
    exit -1
fi
dart format lib
if [ $? -ne 0 ]; then
    echo "Error: format ./lib"
    exit -1
fi


cd example
flutter analyze lib
if [ $? -ne 0 ]; then
    echo "Error: analyze example/lib"
    exit -1
fi
#dart format lib
#if [ $? -ne 0 ]; then
#    echo "Error: format example/lib"
    #exit -1
#fi
cd ..

rm -rf _*.tgz 2>/dev/null

git add .
git commit -m "Etau : Version $VERSION"
git pull origin
git push origin
if [ ! -z "$VERSION" ]; then
    git tag -f $VERSION
    git push  -f origin $VERSION
fi


flutter pub publish
if [ $? -ne 0 ]; then
    echo "Error: flutter pub publish[etau]"
    exit -1
fi






echo 'E.O.J'
