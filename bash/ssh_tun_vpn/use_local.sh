
. vars.sh

ip route del default
ip route add default via $INTERNAL_GW dev $INTERNAL_IF
