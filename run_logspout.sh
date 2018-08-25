#!/bin/bash
docker stop elk_logspout  
docker rm elk_logspout 
docker run -d --name="elk_logspout" \
 --network="docker_elk_network" \
 --volume=/var/run/docker.sock:/var/run/docker.sock \
 bekt/logspout-logstash logstash+tcp://logstash:5000 

