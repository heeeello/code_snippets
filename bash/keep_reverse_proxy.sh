#!/bin/bash -x

# Let this autostart
# Change server side /etc/ssh/sshd_config, TCPKeepAlive  yes
# Change client side /etc/ssh/ssh_config,  ExitOnForwardFailure yes

EXT_HOST=${EXT_HOST_IP}
LDAP_HOST=${LDAP_HOST_IP}
count=0
MAX_RETRIES=1000


while true; do
  PORT=389

  # Try to kill remote listening 389 port process first
  ssh $EXT_HOST "fuser -k -n tcp 389"
  sleep 3;

  echo "connectting to $EXT_HOST:$PORT at `date`";
  ssh -NR  $PORT:$LDAP_HOST:389  $EXT_HOST;

  echo "connection to $EXT_HOST:$PORT closed at `date`";

  let count=count+1
  if [[  count -ge $MAX_RETRIES ]]; then
    echo "Tried $MAX_RETRIES times, exitting.."
    break
  fi

done
