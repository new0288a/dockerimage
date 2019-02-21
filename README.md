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
## Preparation
PPPoE login information on "pap-secrets" and "dsl-provider" which you should modify first to meet your own environment. You can modify it first before building up the image or modify both files after container startup. Below will show which place it should be replaced on "pap-secrets" and "dsl-provider".

##### dsl-provider
*/etc/ppp/peers/dsl-provider*<br>
replace "test" to the PPPoE login username
```
user "test"
```
##### pap-secrets
*/etc/ppp/pap-secrets*<br>
replace "test" and "pass" to the PPPoE login username and password
```
"test" * "pass"
```
## Start-up container
Container should be attached to **macvlan** network and be assigned with higher privilege.
```
docker run -it --network my-macvlan-net --cap-add=NET_ADMIN --privileged ubuntu-pppoe
```
## Start-up PPPoE session
Go into container and start PPPoE session with below command
```
pon dsl-provider
```
