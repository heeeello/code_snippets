#!/bin/bash -x

# Let this autostart

ME=$0

REMOTE_HOST=192.168.205.30
REMOTE_SSH_PORT=22

REMOTE_FORWARDING_HOST=127.0.0.1
REMOTE_FORWARDING_PORT=8080

LOCAL_LISTEN_IP='*'
LOCAL_LISTEN_PORT=38080

count=0
MAX_RETRIES=1000



while true; do
  
  # Try to kill listening-port process first
  fuser -k -n tcp $LOCAL_LISTEN_PORT
  sleep 3;


  echo "$ME: connectting to $EXT_HOST:$EXT_PORT for $count times at `date`";
  echo ssh -p $REMOTE_SSH_PORT -NL  $LOCAL_LISTEN_IP:$LOCAL_LISTEN_PORT:$REMOTE_FORWARDING_HOST:$REMOTE_FORWARDING_PORT  $REMOTE_HOST;
  ssh -p $REMOTE_SSH_PORT -NL  $LOCAL_LISTEN_IP:$LOCAL_LISTEN_PORT:$REMOTE_FORWARDING_HOST:$REMOTE_FORWARDING_PORT  $REMOTE_HOST;

  echo "$ME: connection to $REMOTE_HOST:$REMOTE_SSH_PORT closed at `date`";
   
  let count=count+1  
  if [[  count -ge $MAX_RETRIES ]]; then
    echo "$ME: Tried $MAX_RETRIES times, exitting.."
    break
  fi

done


