#!/usr/bin/env bash
# !/bin/sh
WORK="/usr/share/elasticsearch"
LOGSTASH="logstash-5.2.1"
DOCKER_NAME="elasticsearch"
LOGSTASH_SH=${WORK}/${LOGSTASH}
NAME=$1

function start() {
   docker cp etc ${DOCKER_NAME}:${LOGSTASH_SH}
   docker exec -i ${DOCKER_NAME}  ${LOGSTASH_SH}/bin/logstash -f ${LOGSTASH_SH}/etc/${NAME}.conf > /root/logs/elasticsearch/${NAME} &
}
echo "脚本启动:"${NAME}
case ${NAME} in
    device)
        start
         ;;
     *)
         echo -e "\033[31m Unkown command, please use device \033[0m"
         ;;
esac


