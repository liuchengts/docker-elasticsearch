#!/usr/bin/env bash
#echo "开始设置docker可用的最大内存"
#echo 'vm.max_map_count=262144 ' >> /etc/sysctl.conf
#sysctl -w vm.max_map_count=262144
docker-compose -f elasticsearch/docker-compose.yml up -d
docker-compose -f kibana/docker-compose.yml up -d
docker-compose -f logstash/docker-compose.yml up -d

docker cp  elasticsearch/docker/*  es01:/usr/share/elasticsearch/config
docker cp  elasticsearch/docker/*  es02:/usr/share/elasticsearch/config
docker cp  elasticsearch/docker/*  es03:/usr/share/elasticsearch/config
docker cp  kibana/docker/*  kibana:/usr/share/kibana/config
docker cp  logstash/docker/config/*  logstash:/usr/share/logstash/config
docker cp  logstash/docker/dataconf  logstash:/usr/share/logstash
docker restart es01 es02 es03 kibana
