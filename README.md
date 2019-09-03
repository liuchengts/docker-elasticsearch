# docker-elasticsearch

# 使用步骤
## 注意 
* 因为默认es启动内存默认配置为2g(这个值可以手动修改)   因此docker内存必须设置为容器内存最大值为2g
宿主机执行 
 ``` 
 vi /etc/sysctl.conf 增加  vm.max_map_count=262144 
 ```
或者执行 
```
sysctl -w vm.max_map_count=262144
```
## 启动elasticsearch
* 直接使用镜像
```
docker run -p 9200:9200 -p 9300:9300 -d registry.cn-hangzhou.aliyuncs.com/lcts/elasticsearch-server:latest --name=es
```
* 最简单的启动方式( 对应 run 文件夹)
```
 docker-compose up -d -f run/docker-compose.yml
```
* 基于dockerhub官方镜像启动(对应 source 文件夹)
```
docker-compose up -d -f source/docker-compose.yml
```
## 启动elasticsearch-head( 对应 head 文件夹)
```
docker-compose up -d -f head/docker-compose.yml
```
## 创建数据同步方案( 对应 sh/logstash 文件夹)
* 修改logstash.sh脚本，使其对应启动的容器，如果没有改变当前项目相关名称是不用做更改的
* 修改etc下的 conf文件，名字可以按自己需求更改，主要配置同步数据源
* 修改etc下的 sql文件，数据同步的sql以及规则
* etc下的文件可以按需求增加多个，最好是一种业务数据对应一个 conf和sql

## 访问仪表板
* http://localhost:9100

## 访问elasticsearch服务
* 一个是httpapi端口 一个是java客户端端口