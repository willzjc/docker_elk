docker run --name="logspout" \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    -e ROUTE_URIS=logstash+tcp://localhost:5000 logstash

docker run --name="logspout" \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    -e ROUTE_URIS=logstash+tcp://logstash.home.local:5000 \
    localhost/logspout-logstash

docker run --name="logspout" \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    -e ROUTE_URIS=logstash+tcp://logstash_base:5000 \
    localhost/logspout-logstash -itd --network=multi-host-network elkstackdocker_network


docker run --name="logspout" \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    -e ROUTE_URIS=logstash+tcp://logstash:5000 \
    bekt/logspout-logstash -itd --network=multi-host-network elkstackdocker_network

  
docker run --name="logspout" \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    -e ROUTE_URIS=logstash+tcp://logstash:5000 \
    localhost/logspout-logstash -itd --network=multi-host-network elkstackdocker_network

