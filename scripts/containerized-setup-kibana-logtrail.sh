#!/bin/bash

# Logtrail must lockstep match Kibana version
# List of available releases are at: https://github.com/sivasamyk/logtrail/releases

# Default logtrail version

export LOGTRAIL_BINARY_URL="https://github.com/sivasamyk/logtrail/releases/download/v0.1.29/logtrail-6.3.2-0.1.29.zip" ;
export LOCALTAG=$TAG

if [ -z $1 ] ; then
	echo -e "No argument passed"
	if [ -z $LOCALTAG  ] ; then
		echo '${TAG} also empty - Defaulting to 6.4.0 as TAG' ;
		export LOCALTAG="6.4.0";
	fi
else
	export LOCALTAG=$1 ;
fi

# Version checking
if [ "${LOCALTAG}" == "6.4.0" ] ; then
	export LOGTRAIL_BINARY_URL="https://github.com/sivasamyk/logtrail/releases/download/v0.1.30/logtrail-6.4.0-0.1.30.zip" ;
elif [ "${LOCALTAG}" = "6.3.2" ]  ; then
	export LOGTRAIL_BINARY_URL="https://github.com/sivasamyk/logtrail/releases/download/v0.1.29/logtrail-6.3.2-0.1.29.zip" ;
elif [ "${LOCALTAG}" = "6.3.0" ]  ; then
	export LOGTRAIL_BINARY_URL="https://github.com/sivasamyk/logtrail/releases/download/v0.1.27/logtrail-6.3.0-0.1.27.zip" ;
elif [ "${LOCALTAG}" = "6.2.4" ]  ; then
	export LOGTRAIL_BINARY_URL="https://github.com/sivasamyk/logtrail/releases/download/v0.1.27/logtrail-6.2.4-0.1.27.zip" ;
elif [ "${LOCALTAG}" = "6.5.0" ]  ; then
	export LOGTRAIL_BINARY_URL="https://github.com/sivasamyk/logtrail/releases/download/v0.1.30/logtrail-6.5.0-0.1.30.zip" ;
else
	echo "Must define version for this to function"
	exit 1
fi

# Installs Logtrail via container execution
echo "Variables set at ${LOCALTAG}, from URL: ${LOGTRAIL_BINARY_URL}. Next step: Attempting to install now if not present"
if /usr/share/kibana/bin/kibana-plugin list | grep logtrail ; then echo 'Not installing, plugin already present' ; else /usr/share/kibana/bin/kibana-plugin install $LOGTRAIL_BINARY_URL ; fi

# Update logtrail config
rm /usr/share/kibana/plugins/logtrail/logtrail.json
ln -s /usr/share/kibana/logtrail.json /usr/share/kibana/plugins/logtrail/logtrail.json
