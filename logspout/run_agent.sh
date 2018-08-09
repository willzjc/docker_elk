#/bin/bash
docker rm elk_logspout
docker run -d --name="elk_logspout" --volume=/var/run/docker.sock:/var/run/docker.sock bekt/logspout-logstash logstash+tcp://sy4lab01:5000 --network=network
