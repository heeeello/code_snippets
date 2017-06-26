#!/bin/bash -x

# Let this autostart

# Open REMOTE_HOST's sshd gateway port, tcp forwarding
# Config sshd keep alive. ClientAliveInterval 60; ClientAliveCountMax 3


ME=$0

REMOTE_HOST=192.168.205.30
REMOTE_SSH_PORT=22

REMOTE_LISTEN_IP='*'
REMOTE_LISTEN_PORT=30080

LOCAL_FORWARDING_HOST=127.0.0.1
LOCAL_FORWARDING_PORT=80

count=0
MAX_RETRIES=1000


while true; do

  # Try to kill listening-external-port process first
  ssh -p $REMOTE_SSH_PORT $REMOTE_HOST "fuser -k -n tcp $REMOTE_LISTEN_PORT"
  sleep 3;

  echo "$ME: connectting to $REMOTE_HOST:$REMOTE_SSH_PORT for $count times at `date`";
  echo ssh -p $REMOTE_SSH_PORT -NR  $REMOTE_LISTEN_IP:$REMOTE_LISTEN_PORT:$LOCAL_FORWARDING_HOST:$LOCAL_FORWARDING_PORT  $REMOTE_HOST;
  ssh -p $REMOTE_SSH_PORT -NR  $REMOTE_LISTEN_IP:$REMOTE_LISTEN_PORT:$LOCAL_FORWARDING_HOST:$LOCAL_FORWARDING_PORT  $REMOTE_HOST;

  echo "$ME: connection to $REMOTE_HOST:$REMOTE_SSH_PORT closed at `date`";
   
  let count=count+1  
  if [[  count -ge $MAX_RETRIES ]]; then
    echo "$ME: Tried $MAX_RETRIES times, exitting.."
    break
  fi

done



