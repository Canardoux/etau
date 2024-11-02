#!/bin/bash

if [ "_$1" = "_REL" ] ; then
  

# flutter_sound/example/pubspec.yaml
#-----------------------------------
        gsed -i  "s/^ *tauweb: *#* *\(.*\)$/  tauweb: \1/"                                                                                                 example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\.\.\/tauweb # tauweb Dir$/#    path: \.\.\.\.\/ # tauweb Dir/"                                                           example/pubspec.yaml

        gsed -i  "s/^ *tauwars: *#* *\(.*\)$/  tauwars: \1/"                                                                                               example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/tauwars # tauwars Dir$/#    path: \.\.\/tauweb # tauwars Dir/"                                                          example/pubspec.yaml

        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: \1/"                                                                                                     example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\\.\.\/ # etau Dir$/#    path: \.\.\\.\.\/ # etau Dir/"                                                                   example/pubspec.yaml

        exit 0

#========================================================================================================================================================================================================


elif [ "_$1" = "_DEV" ]; then
 

# flutter_sound/example/pubspec.yaml
#-----------------------------------
        gsed -i  "s/^ *tauweb: *#* *\(.*\)$/  tauweb: # \1/"                                                                                              example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/tauweb # tauweb Dir$/    path: \.\.\/ # tauweb Dir/"                                                                  example/pubspec.yaml

        gsed -i  "s/^ *tauwars: *#* *\(.*\)$/  tauwars: # \1/"                                                                                            example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\tauwars # tauwars Dir$/    path: \.\.\/tauwars # tauwars Dir/"                                                         example/pubspec.yaml

        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: # \1/"                                                                                                  example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\ # etau Dir$/    path: \.\.\/ # etau Dir/"                                                                             example/pubspec.yaml
 
        exit 0

else
        echo "Correct syntax is $0 [REL | DEV]"
        exit -1
fi
echo "Done"
