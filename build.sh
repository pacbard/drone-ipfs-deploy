#!/bin/bash

if [[ ! -z "${PINNING_SERVICE}" ]]; then
    PIN="-p $PINNING_SERVICE"
else
    PIN="-p infura"
fi

if [[ ! -z "${DNS_SERVICE}" ]]; then
    DSN="-d $DNS_SERVICE"
else
    DNS=""
fi

hash=`npx ipfs-deploy $SOURCE --no-clipboard $PIN $DNS | tail -1`
echo $hash >> .hash

