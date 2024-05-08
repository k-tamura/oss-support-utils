#!/bin/bash
if [ ! -e apache-tomcat-$1.tar.gz ]; then
    major_version=${1%%.*}
    wget https://archive.apache.org/dist/tomcat/tomcat-$major_version/v$1/bin/apache-tomcat-$1.tar.gz
fi
rm -fr apache-tomcat-$1
tar -zxvf apache-tomcat-$1.tar.gz
cp -pr overwrite/* apache-tomcat-$1
chmod +x apache-tomcat-$1/bin/setenv.sh
if [[ $1 == *"."* ]]; then
    apache-tomcat-$1/bin/catalina.sh jpda start
else
    echo "Please give the version number as the first argument."
fi
tail -f apache-tomcat-$1/logs/catalina.out

