#!/bin/bash

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

# Color codes via https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux#5947802
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

log() {
  # echo in color
  echo -e "${GREEN}${1}${NC}"
}

rlog() {
  # echo in color
  echo -e "${RED}${1}${NC}"
}

HOST="http://0.0.0.0:3030"
RUN_LATEST_FUSEKI=1
if [ ${RUN_LATEST_FUSEKI} -lt 1 ]; then
    ## -- Apache Jean Fuseki v3.7.0: -- ##
    export FUSEKI_HOME="${PWD}/apache-jena-fuseki-3.7.0"
else
    ## -- Apache Jean Fuseki v4.4.0: -- ##
    export FUSEKI_HOME="${PWD}/apache-jena-fuseki-4.4.0"
fi
log "Starting Fuseki server in the background"
${FUSEKI_HOME}/fuseki-server --config=fuseki_config.ttl > fuseki.log &
    
log "Interface running at ${HOST}"

sleep 8s

FBIN="${FUSEKI_HOME}/bin"

#${FBIN}/s-put ${HOST}/dataset/data default data/raw/persons_and_cars.ttl

#${FBIN}/s-put ${HOST}/foaf/data default data/raw/foaf_person.ttl
log "Loaded Schema.org encoded data into named graph default"

wait
