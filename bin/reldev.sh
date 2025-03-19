#!/bin/bash

if [ "_$1" = "_REL" ] ; then
  



        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: \1/"                                                                                         example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/ # etau Dir$/#    path: \.\.\/ # etau Dir/"                                                                 example/pubspec.yaml
        
        gsed -i  "s/^ *tau_web: *#* *\(.*\)$/  tau_web: \1/"                                                                                   example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/tau_web # tau_web Dir$/#    path: \.\.\/\.\.\/tau_web # tau_web Dir/"                                             example/pubspec.yaml

        gsed -i  "s/^ *tau_war: *#* *\(.*\)$/  tau_war: \1/"                                                                                   example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/tau_war # tau_war Dir$/#    path: \.\.\/\.\.\/tau_war # tau_war Dir/"                                          example/pubspec.yaml





#========================================================================================================================================================================================================


elif [ "_$1" = "_DEV" ]; then
 

        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: # \1/"                                                                                                  example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/ # etau Dir$/    path: \.\.\/ # etau Dir/"                                                                            example/pubspec.yaml
 
        gsed -i  "s/^ *tau_web: *#* *\(.*\)$/  tau_web: # \1/"                                                                                            example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/tau_web # tau_web Dir$/    path: \.\.\/\.\.\/tau_web # tau_web Dir/"                                            example/pubspec.yaml

        gsed -i  "s/^ *tau_war: *#* *\(.*\)$/  tau_war: # \1/"                                                                                            example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/tau_war # tau_war Dir$/    path: \.\.\/\.\.\/tau_war # tau_war Dir/"                                           example/pubspec.yaml







else
        echo "Correct syntax is $0 [REL | DEV]"
        exit -1
fi

cd ../tau_web
bin/reldev.sh $1
cd ../etau

cd ../tau_war
bin/reldev.sh $1
cd ../etau

echo "Done"
