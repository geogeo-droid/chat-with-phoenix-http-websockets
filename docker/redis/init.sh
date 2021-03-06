#!/bin/bash

set -euxo pipefail

for port in $CLUSTER_PORTS; do
    mkdir -p /usr/local/etc/redis/"${port}"
    PORT=${port} envsubst < /usr/local/etc/redis/redis.conf.tmpl > /usr/local/etc/redis/"${port}"/redis.conf
done

chown -R redis.redis /usr/local/etc/redis

create_nodes_command=""
for port in $CLUSTER_PORTS; do
  create_nodes_command="${create_nodes_command}redis-server /usr/local/etc/redis/${port}/redis.conf && "
done

nodes=""
for port in $CLUSTER_PORTS; do
  IP=$(hostname -i)
  nodes="$nodes ${IP}:${port}"
done

if ! ls /usr/local/etc/redis/tmp/redis_cluster1/dump-*.rdb >/dev/null 2>&1; then
  bash -c "${create_nodes_command}yes yes | redis-cli --cluster create${nodes} --cluster-replicas ${SLAVES_PER_MASTER} && tail -f /dev/null"
else
  bash -c "${create_nodes_command}tail -f /dev/null"
fi
