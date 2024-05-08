#!/bin/bash
if [ ! -e keycloak-$1.zip ]; then
    wget https://github.com/keycloak/keycloak/releases/download/$1/keycloak-$1.zip
fi
rm -fr keycloak-$1
unzip keycloak-$1.zip
if [[ $1 == *"."* ]]; then
    major_version=${1%%.*}
    if [ $major_version -le 16 ]; then
                keycloak-$1/bin/add-user-keycloak.sh --user admin --password admin
                keycloak-$1/bin/kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user admin --password admin
                keycloak-$1/bin/kcadm.sh update realms/master -s sslRequired=NONE
                #keycloak-$1/bin/jboss-cli.sh --connect command=:shutdown
                keycloak-$1/bin/standalone.sh -b 0.0.0.0 --debug
        else
                export KEYCLOAK_ADMIN=admin
                export KEYCLOAK_ADMIN_PASSWORD=admin
                keycloak-$1/bin/kc.sh start-dev --debug
        fi
else
    echo "Please give the version number as the first argument."
fi 
