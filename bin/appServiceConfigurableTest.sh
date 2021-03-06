#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/app-service-configurable.postman_collection.json"
ENV_PATH="environment/app-service-configurable${ENV_SUFFIX}.postman_environment.json"

if [ -f $NAMESFILE ]; then

	. $NAMESFILE

else
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating AppServiceConfigurable Test."

echo "[info] ---------- use docker-compose run newman ----------"

docker-compose -f ${docker_compose_test_tools} run --rm postman run ${COLLECTION_PATH} \
    --environment=${ENV_PATH} --delay-request 500 --reporters="junit,cli"

echo "Info:AppServiceConfigurable Test Completed."
