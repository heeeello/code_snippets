#!/bin/bash -x

# Let this autostart

# Add sighandler for sigterm(kill default)

EXT_HOST=120.27.28.17
LDAP_HOST=135.252.137.10
LDAP_PORT=389
count=0
MAX_RETRIES=1000

REMOTE_PORT=3333

while true; do

  # Try to kill remote listening-port process first
  ssh $EXT_HOST "fuser -k -n tcp $REMOTE_PORT"
  sleep 3;

  echo "connectting to $EXT_HOST:$PORT at `date`";
  ssh -NR  $REMOTE_PORT:$LDAP_HOST:$LDAP_PORT  $EXT_HOST &
  
  THIS_PID=$!

  # SIGKILL could not be trapped. Will leave subprocess alive
  trap "kill $THIS_PID; exit" TERM

  wait

  echo "connection to $EXT_HOST:$REMOTE_PORT closed at `date`";
   
  let count=count+1  
  if [[  count -ge $MAX_RETRIES ]]; then
    echo "Tried $MAX_RETRIES times, exitting.."
    break
  fi

done

