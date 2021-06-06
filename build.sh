#!/bin/bash
hash=`npx ipfs-deploy public/ -p pinata | tail -1`
curl https://www.duckdns.org/update\?domains\=$DUCKDNS_DOMAIN\&token\=$DUCKDNS_TOKEN\&txt\=dnslink\=/ipfs/$hash

printf "\nIPFS root hash: $hash"
