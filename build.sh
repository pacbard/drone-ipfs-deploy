#!/bin/bash
set -e

IPFS_DEPLOY_OPTIONS=""

if [ -n "$PLUGIN_PATH" ]
then
    IPFS_DEPLOY_OPTIONS="$PLUGIN_PATH"
fi

IPFS_DEPLOY_OPTIONS="$IPFS_DEPLOY_OPTIONS --no-clipboard=true"

if [ -n "$PLUGIN_PINNER" ]
then
    IPFS_DEPLOY_OPTIONS="$IPFS_DEPLOY_OPTIONS -p $PLUGIN_PINNER"
fi

if [ -n "$PLUGIN_DNS" ]
then
    IPFS_DEPLOY_OPTIONS="$IPFS_DEPLOY_OPTIONS -d $PLUGIN_DNS"
fi

if [ -n "$PLUGIN_OPTIONS" ]
then
    IPFS_DEPLOY_OPTIONS="$IPFS_DEPLOY_OPTIONS $PLUGIN_OPTIONS"
fi

hash=`npx ipfs-deploy $IPFS_DEPLOY_OPTIONS | tail -1`
echo $hash >> .hash

