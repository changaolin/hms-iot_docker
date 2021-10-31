# hms-iot_docker
鸿蒙 iot 小熊派 ubuntu20.04 开发环境
## 使用方式一、直接获取镜像
```shell
docker pull thne/hms:01
docker run -it --name hms_demo -v ~/code:/code thne/hms:01 # ~/code:/code 表示会把容器中的/code目录映射到 本机～/code 目录
hpm init -t default && hpm install @bearpi/bearpi_hm_nano && hpm dist # 获取hms源码然后构建
```
## 使用方式二、自己构建
### 1. 拉取本代码仓
链接: https://pan.baidu.com/s/12XeFauIhpBs0mF4XNomDDg 提取码: 6adr 
### 2. 构建镜像
```shell
docker build -t hms:01 -f Dockerfile . --no-cache                                       
```
### 3. 启动镜像
``` shell 
docker run -it --name hms_demo -v ~/code:/code hms:01 # ~/code:/code 表示会把容器中的/code目录映射到 本机～/code 目录
hpm init -t default && hpm install @bearpi/bearpi_hm_nano && hpm dist # 获取hms源码然后构建
```
