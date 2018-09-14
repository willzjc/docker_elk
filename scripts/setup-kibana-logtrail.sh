#!/bin/bash

# Logtrail must lockstep match Kibana version
# List of available releases are at: https://github.com/sivasamyk/logtrail/releases

# Default logtrail version

export LOGTRAIL_URL="https://github.com/sivasamyk/logtrail/releases/download/v0.1.29/logtrail-6.3.2-0.1.29.zip" ;
export LOCALTAG=$TAG


if [ -z $1 ] ; then
	echo -e "No argument passed"
else
	export LOCALTAG=$1 ;
fi

# Version checking
if [ "${LOCALTAG}" == "6.4.0" ] ; then
	export LOGTRAIL_URL="https://github.com/sivasamyk/logtrail/releases/download/v0.1.30/logtrail-6.4.0-0.1.30.zip" ;
elif [ "${LOCALTAG}" = "6.3.2" ]  ; then
	export LOGTRAIL_URL="https://github.com/sivasamyk/logtrail/releases/download/v0.1.29/logtrail-6.3.2-0.1.29.zip" ;
elif [ "${LOCALTAG}" = "6.3.0" ]  ; then
	export LOGTRAIL_URL="https://github.com/sivasamyk/logtrail/releases/download/v0.1.27/logtrail-6.3.0-0.1.27.zip" ;
elif [ "${LOCALTAG}" = "6.2.4" ]  ; then
	export LOGTRAIL_URL="https://github.com/sivasamyk/logtrail/releases/download/v0.1.27/logtrail-6.2.4-0.1.27.zip" ; 
else
	echo "Must define version for this to function"
	exit 1
fi

# Installs Logtrail via container execution
echo "Variables set at ${LOCALTAG}, from URL: ${LOGTRAIL_URL}. Next step: Attempting to install now if not present"
docker exec -it kibana bash -c "if /usr/share/kibana/bin/kibana-plugin list | grep logtrail  ; then echo 'Not installing, plugin already present' ; else /usr/share/kibana/bin/kibana-plugin install $LOGTRAIL_URL ; fi"
echo -e "Restartng Kibana..."
docker restart kibana

