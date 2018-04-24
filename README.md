# aliyunServiceTools
a simple script to control the aliyun service

### About this
Just control some aliyun service's status.

Basic service list: "aliyun.service", "aegis.service", "cloudmonitor.service".

Surely, this script could run ```above centos7```

### Usage
1. git this repo:
```shell
# git clone https://github.com/binbin666/aliyunServiceTools
```
2. make sure this script worked with execute
```shell
# cd aliyunServiceTools
# chmod +x aliyunService.sh
```
3. just run and chose simple tip to execute
```shell
# sh aliyunService.sh
```
> 0: exit
> 1: start service
> 2: stop service

### Finally
you could add more services to ```checkServiceList``` block whatever you want, just do it.
