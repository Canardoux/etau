#!/bin/bash

if [ "_$1" = "_REL" ] ; then
  

        gsed -i  "s/^ *tauweb: *#* *\(.*\)$/  tauweb: \1/"                                                                                                 example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/tauweb # tauweb Dir$/#    path: \.\.\/\.\.\/tauweb # tauweb Dir/"                                                 example/pubspec.yaml

        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: \1/"                                                                                                     example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/ # etau Dir$/#    path: \.\.\/ # etau Dir/"                                                                             example/pubspec.yaml

        exit 0

#========================================================================================================================================================================================================


elif [ "_$1" = "_DEV" ]; then
 

        gsed -i  "s/^ *tauweb: *#* *\(.*\)$/  tauweb: # \1/"                                                                                              example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/tauweb # tauweb Dir$/    path: \.\.\/\.\.\/tauweb # tauweb Dir/"                                                example/pubspec.yaml

        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: # \1/"                                                                                                  example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/ # etau Dir$/    path: \.\.\/ # etau Dir/"                                                                            example/pubspec.yaml
 
        exit 0

else
        echo "Correct syntax is $0 [REL | DEV]"
        exit -1
fi
echo "Done"
