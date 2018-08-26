#!/bin/bash

IMAGE=logspout
DOCKERNETWORK=docker_elk_network

docker stop elk_logspout
docker rm elk_logspout
#IMAGE=bekt/logspout-logstash
docker run -d --name="elk_logspout" \
 --network="${DOCKERNETWORK}" \
 --volume=/var/run/docker.sock:/var/run/docker.sock \
 logspout logstash+tcp://logstash:5000
