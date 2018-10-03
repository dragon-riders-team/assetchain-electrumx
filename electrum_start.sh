#!/bin/bash

source ac_parameters.conf

DIR=$HOME/data_electrumx

if [ ! -d $DIR ]
then
  mkdir -p $DIR
fi

source $KOMODO_DIR/$AC_NAME/$AC_NAME.conf

DAEMON_URL=http://$rpcuser:$rpcpassword@127.0.0.1:$rpcport

docker run \
  -ti -d --rm \
  --name electrumx_$AC_NAME \
  --net host \
  -v $DIR:/data \
  -e DAEMON_URL=$DAEMON_URL \
  -e COIN=Komodo \
  -p 50002:50002 \
  lukechilds/electrumx

