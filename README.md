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
## Start-up container
Container should be attached to **macvlan** network and be assigned with higher privilege. The parameter **pppoeuser** & **pppoepw** are username and password for PPPoE authentication.
```
docker run -it --rm --network my-macvlan-net --cap-add=NET_ADMIN --privileged --env pppoeuser=myname --env pppoepw=mypassword ubuntu-pppoe
```
## Start-up PPPoE session
Go into container and start PPPoE session with below command
```
pon dsl-provider
```
