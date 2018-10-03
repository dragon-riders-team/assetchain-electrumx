#!/bin/bash

source ac_parameters.conf

DIR=$ZCASH_PARAMS
if [ ! -d $DIR ]
then
  mkdir -p $DIR
fi
DIR=$KOMODO_DIR
if [ ! -d $DIR ]
then
  mkdir -p $DIR
fi

docker run \
  --name $AC_NAME \
  --rm -d \
  --net host \
  --mount "type=bind,src=$ZCASH_PARAMS,dst=/home/komodo/.zcash-params" \
  --mount "type=bind,src=$KOMODO_DIR,dst=/home/komodo/.komodo" \
  kmdplatform/komodod:lite \
  -bind=0.0.0.0 \
  -rpcbind=127.0.0.1 \
  -rpcallowip=0.0.0.0/0 \
  -ac_name=$AC_NAME \
  -ac_supply=$AC_SUPPLY \
  -ac_reward=$AC_REWARD \
  -ac_staked=$AC_STAKED \
  -ac_cc=$AC_CC \
  -ac_end=$AC_END \
  -addnode=$SEEDIP \
  -txindex=1

