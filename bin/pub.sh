#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version> "
        exit -1
fi



VERSION=$1
VERSION_CODE=${VERSION#./}
VERSION_CODE=${VERSION_CODE#+/}

echo '**********************  pub Etau **********************'

bin/reldev.sh REL
bin/setver.sh $VERSION

cp -v ../etau-doc/index.md README.md
gsed -i '1,6d' README.md

flutter analyze lib
if [ $? -ne 0 ]; then
    echo "Error: analyze ./lib"
    #exit -1
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
    #exit -1
fi
cd ..


dart doc .


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
    ####exit -1
fi

read -p "Press enter to continue"



# We cannot do that earlier, because we don't want an earlier dependency

cd ../tauweb
bin/pub.sh $1
if [ $? -ne 0 ]; then
    echo "Error: publish tauweb"
    ##exit -1
fi
cd ../etau

cd ../tauwar
bin/pub.sh $1
if [ $? -ne 0 ]; then
    echo "Error: publish tauwar"
    ##exit -1
fi
cd ../etau

# We cannot do that earlier, because we don't want an earlier dependency

cd example
flutter build web --release
if [ $? -ne 0 ]; then
    echo "Error"
    exit -1
fi
cd ..


dart doc .
cd ../etau-doc
bin/pub.sh
cd ../etau


# Perhaps could be done in `setver.sh` instead of here
#gsed -i  "s/^\( *version: \).*/\1$VERSION/"                                  ../tau_doc/_data/sidebars/etau_sidebar.yml
#gsed -i  "s/^ETAU_VERSION:.*/ETAU_VERSION: $VERSION/"                        ../tau_doc/_config.yml

git add .
git commit -m "Etau : Version $VERSION"
git pull origin
git push origin
if [ ! -z "$VERSION" ]; then
    git tag -f $VERSION
    git push  -f origin $VERSION
fi



#cd ../tau_doc
#bin/pub.sh
#if [ $? -ne 0 ]; then
#    echo "Error: tau_doc/bin/pub.sh"
#    exit -1
#fi
#cd ../etau


echo 'E.O.J for pub etau'
exit 0