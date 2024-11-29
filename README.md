# oss-support-utils
OSS support utils just for me

## Start up HA Keycloak containers w/ PostgreSQL

```bash
$ cd keycloak
$ docker compose -f postgres.yml up
$ docker build . -t mykeycloak
$ docker run --name mykeycloak -p 8443:8443 \
    -e KC_BOOTSTRAP_ADMIN_USERNAME=admin \
    -e KC_BOOTSTRAP_ADMIN_PASSWORD=password mykeycloak start
```

## Install and start up Keycloak on JVM

```bash
$ cd keycloak
$ ./re-install-keycloak.sh 26.0.5
```

## Install and start up Tomcat on JVM

```bash
$ cd tomcat
$ ./re-install-tomcat.sh 9.0.98
```
