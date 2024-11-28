#!/bin/bash

if [ "_$1" = "_REL" ] ; then
  



        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: \1/"                                                                                                     example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/ # etau Dir$/#    path: \.\.\/ # etau Dir/"                                                                             example/pubspec.yaml
        
        gsed -i  "s/^ *tau_web: *#* *\(.*\)$/  tau_web: \1/"                                                                                               example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/tau_web # tau_web Dir$/#    path: \.\.\/\.\.\/tau_web # tau_web Dir/"                                             example/pubspec.yaml

        gsed -i  "s/^ *tau_wars: *#* *\(.*\)$/  tau_wars: \1/"                                                                                             example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/tau_wars # tau_wars Dir$/#    path: \.\.\/\.\.\/tau_wars # tau_wars Dir/"                                         example/pubspec.yaml




        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: \1/"                                                                                                     examples_basic/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/ # etau Dir$/#    path: \.\.\/ # etau Dir/"                                                                             examples_basic/pubspec.yaml
        
        gsed -i  "s/^ *tau_web: *#* *\(.*\)$/  tau_web: \1/"                                                                                               examples_basic/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/tau_web # tau_web Dir$/#    path: \.\.\/\.\.\/tau_web # tau_web Dir/"                                             examples_basic/pubspec.yaml

        gsed -i  "s/^ *tau_wars: *#* *\(.*\)$/  tau_wars: \1/"                                                                                             examples_basic/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/tau_wars # tau_wars Dir$/#    path: \.\.\/\.\.\/tau_wars # tau_wars Dir/"                                         examples_basic/pubspec.yaml




        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: \1/"                                                                                                     examples_mozilla/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/ # etau Dir$/#    path: \.\.\/ # etau Dir/"                                                                             examples_mozilla/pubspec.yaml
        
        gsed -i  "s/^ *tau_web: *#* *\(.*\)$/  tau_web: \1/"                                                                                               examples_mozilla/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/tau_web # tau_web Dir$/#    path: \.\.\/\.\.\/tau_web # tau_web Dir/"                                             examples_mozilla/pubspec.yaml

        gsed -i  "s/^ *tau_wars: *#* *\(.*\)$/  tau_wars: \1/"                                                                                             examples_mozilla/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/tau_wars # tau_wars Dir$/#    path: \.\.\/\.\.\/tau_wars # tau_wars Dir/"                                         examples_mozilla/pubspec.yaml





        exit 0

#========================================================================================================================================================================================================


elif [ "_$1" = "_DEV" ]; then
 

        gsed -i  "s/^ *tau_web: *#* *\(.*\)$/  tau_web: # \1/"                                                                                            example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/tau_web # tau_web Dir$/    path: \.\.\/\.\.\/tau_web # tau_web Dir/"                                            example/pubspec.yaml

        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: # \1/"                                                                                                  example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/ # etau Dir$/    path: \.\.\/ # etau Dir/"                                                                            example/pubspec.yaml
 
        gsed -i  "s/^ *tau_wars: *#* *\(.*\)$/  tau_wars: # \1/"                                                                                          example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/tau_wars # tau_wars Dir$/    path: \.\.\/\.\.\/tau_wars # tau_wars Dir/"                                        example/pubspec.yaml






        gsed -i  "s/^ *tau_web: *#* *\(.*\)$/  tau_web: # \1/"                                                                                            examples_basic/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/tau_web # tau_web Dir$/    path: \.\.\/\.\.\/tau_web # tau_web Dir/"                                            examples_basic/pubspec.yaml

        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: # \1/"                                                                                                  examples_basic/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/ # etau Dir$/    path: \.\.\/ # etau Dir/"                                                                            examples_basic/pubspec.yaml
 
        gsed -i  "s/^ *tau_wars: *#* *\(.*\)$/  tau_wars: # \1/"                                                                                          examples_basic/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/tau_wars # tau_wars Dir$/    path: \.\.\/\.\.\/tau_wars # tau_wars Dir/"                                        examples_basic/pubspec.yaml





        gsed -i  "s/^ *tau_web: *#* *\(.*\)$/  tau_web: # \1/"                                                                                            examples_mozilla/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/tau_web # tau_web Dir$/    path: \.\.\/\.\.\/tau_web # tau_web Dir/"                                            examples_mozilla/pubspec.yaml

        gsed -i  "s/^ *etau: *#* *\(.*\)$/  etau: # \1/"                                                                                                  examples_mozilla/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/ # etau Dir$/    path: \.\.\/ # etau Dir/"                                                                            examples_mozilla/pubspec.yaml
 
        gsed -i  "s/^ *tau_wars: *#* *\(.*\)$/  tau_wars: # \1/"                                                                                          examples_mozilla/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/tau_wars # tau_wars Dir$/    path: \.\.\/\.\.\/tau_wars # tau_wars Dir/"                                        examples_mozilla/pubspec.yaml






       exit 0



else
        echo "Correct syntax is $0 [REL | DEV]"
        exit -1
fi
echo "Done"
