#!/usr/bin/env bash
# !/bin/sh
WORK="/usr/share/logstash"
DOCKER_NAME="logstash"
LOGSTASH_CONF=${WORK}/"dataconf"
LOGSTASH_SH=${WORK}/"bin/logstash"
NAME=$1

function start() {
   docker cp etc ${DOCKER_NAME}:${LOGSTASH_SH}
   docker exec -i ${DOCKER_NAME}  ${LOGSTASH_SH} -f ${LOGSTASH_CONF}/${NAME}.conf > /root/logs/elasticsearch/${NAME} &
}
echo "脚本启动:"${NAME}
case ${NAME} in
    test)
        start
         ;;
     *)
         echo -e "\033[31m Unkown command, please use test \033[0m"
         ;;
esac


