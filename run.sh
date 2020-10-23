#!/bin/bash

[ ! -f ./jdk8-32.tar.gz ] && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u262-b10/openlogic-openjdk-8u262-b10-linux-x32.tar.gz -O ./jdk8-32.tar.gz || echo "JDK8 Present."
[ ! -d ./jdk8-32 ] && echo "Extracting JDK8..." && tar -xf jdk8-32.tar.gz -C . && mv `find -type d -iname "*jdk*"` jdk8-32 || echo "JDK8 Already Extracted."
[ ! -d ./proj ] && echo "Creating Project Folder..." && mkdir -p ./proj || echo "Project Folder Already Present."
./jdk8-32/bin/javac $1 -d ./proj
./jdk8-32/bin/java -cp ./proj $2
rm -rf ./proj
