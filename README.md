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
## Build-up container
Goto the directory whose Dockerfile locate at, and build the container with below command.
```
docker build -t ubuntu-pppoe .
```
## Start-up container
Container should be attached to **macvlan** network and be assigned with higher privilege. The parameters **pppoeuser** & **pppoepw** are username and password for PPPoE authentication.
```
docker run -it --rm --network my-macvlan-net --cap-add=NET_ADMIN --privileged --env pppoeuser=myname --env pppoepw=mypassword ubuntu-pppoe
```
## Start-up PPPoE session
Go into container and start PPPoE session with below command
```
pon dsl-provider
```
If container success to register with pppoe server, you will get a new insterface ppp0 with IP address as below.
```
ppp0: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1492
        inet 1.1.1.100  netmask 255.255.255.255  destination 1.1.1.1
        ppp  txqueuelen 3  (Point-to-Point Protocol)
        RX packets 34778949  bytes 1808910172 (1.8 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 324479905  bytes 480456540430 (480.4 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
