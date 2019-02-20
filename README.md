Introduction
===========================
You can use this dockerfile to build up a Ubuntu image with PPPoE client tools

## Requirement
1. pppoe module should be loaded on docker host.
```
modprobe pppoe
```
2. create macvlan network on docker host for connecting container to outside pppoe server
```
docker network create -d macvlan -o parent=eth0 my-macvlan-net
```
## How To Use
PPPoE login information on **pap-secrets** and **dsl-provider** which you should modify first to meet your own environment. You can modify it first before build up the image or modify both file after container startup. Below will should which place it should be replaced on Dockerfile and dsl-provider.

###### Dockerfile
replace "test" to the PPPoE login username
```
user "test"
```
###### pap-secrets
replace "test" and "pass" to the PPPoE login username and password
```
"test" * "pass"
```
