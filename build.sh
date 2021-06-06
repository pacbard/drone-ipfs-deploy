#!/bin/bash

if [[ ! -z "${PLUGIN_PINNING_SERVICE}" ]]; then
    PIN="-p $PLUGIN_PINNING_SERVICE"
else
    PIN="-p infura"
fi

if [[ ! -z "${PLUGIN_DNS_SERVICE}" ]]; then
    DSN="-d $PLUGIN_DNS_SERVICE"
else
    DNS=""
fi

hash=`npx ipfs-deploy $PLUGIN_SOURCE --no-clipboard $PIN $DNS | tail -1`
echo $hash >> .hash

