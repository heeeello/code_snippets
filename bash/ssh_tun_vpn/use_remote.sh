
. vars.sh
ip route del default
ip route add default via $TUN_PEER_IP dev $TUN_NAME
