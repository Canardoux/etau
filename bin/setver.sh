#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version>"
        exit -1
fi



VERSION=$1
VERSION_CODE=${VERSION//./}
VERSION_CODE=${VERSION_CODE//+/}

gsed -i  "s/^\( *version: *\).*$/\1$VERSION/"                                           pubspec.yaml
gsed -i  "s/^\( *version: *\).*$/\1$VERSION/"                                           examples_basic/pubspec.yaml
gsed -i  "s/^\( *etau: *#* *\^*\).*$/\1$VERSION/"                                       examples_basic/pubspec.yaml
gsed -i  "s/^\( *version: *\).*$/\1$VERSION/"                                           examples_mozilla/pubspec.yaml
gsed -i  "s/^\( *etau: *#* *\^*\).*$/\1$VERSION/"                                       examples_mozilla/pubspec.yaml
gsed -i  "s/^\( *etau: *#* *\^*\).*$/\1$VERSION/"                                       ../tau_web/pubspec.yaml
gsed -i  "s/^\( *## \).*$/\1$VERSION/"                                                  CHANGELOG.md

gsed -i  "s/^ETAU_VERSION:.*/ETAU_VERSION: $VERSION/"                                   ../tau_doc/_config.yml
gsed -i  "s/^\( *version: \).*/\1$VERSION/"                                             ../tau_doc/_data/sidebars/etau_sidebar.yml
