#!/bin/bash

set -euo pipefail

# /usr/share/logstash/bin/logstash-plugin install logstash-filter-fix_protocol
if /usr/share/logstash/bin/logstash-plugin list | grep logstash-filter-fix_protocol  ; then echo 'Already Installed' ; else /usr/share/logstash/bin/logstash-plugin install logstash-filter-fix_protocol ; fi
