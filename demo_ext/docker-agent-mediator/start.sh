#!/bin/bash

# based on code developed by Sovrin:  https://github.com/hyperledger/aries-acapy-plugin-toolbox

echo "using ngrok end point [$NGROK_NAME]"

NGROK_ENDPOINT=null
while [ -z "$NGROK_ENDPOINT" ] || [ "$NGROK_ENDPOINT" = "null" ]
do
    echo "Fetching end point from ngrok service"
    NGROK_ENDPOINT=$(curl --silent $NGROK_NAME:4040/api/tunnels | ./jq -r '.tunnels[] | select(.proto=="https") | .public_url')

    if [ -z "$NGROK_ENDPOINT" ] || [ "$NGROK_ENDPOINT" = "null" ]; then
        echo "ngrok not ready, sleeping 5 seconds...."
        sleep 5
    fi
done

export ACAPY_ENDPOINT=$NGROK_ENDPOINT

echo "Starting aca-py agent with endpoint [$ACAPY_ENDPOINT]"

# ... if you want to echo the aca-py startup command ...
set -x

exec aca-py start \
    --arg-file "${AGENT_ARG_FILE}" \
    --endpoint "${ACAPY_ENDPOINT}" wss://"${MEDIATOR_URL#*://*}"


