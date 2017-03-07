
. vars

ssh $EXTERNAL_IP -p $SSH_PORT ifconfig $TUN_NAME up
ssh $EXTERNAL_IP -p $SSH_PORT ip addr add dev $TUN_NAME $TUN_PEER_IP
ssh $EXTERNAL_IP -p $SSH_PORT ip route add $TUN_NET dev $TUN_NAME

# set snat on remte for forwarding if not exist
if ! ssh $EXTERNAL_IP -p $SSH_PORT "iptables-save -t nat | grep -- \"-A POSTROUTING -o $EXTERNAL_IF -j SNAT --to-source $EXTERNAL_IP\""; then
   ssh $EXTERNAL_IP -p $SSH_PORT iptables -t nat -A POSTROUTING -o $EXTERNAL_IF -j SNAT --to-source $EXTERNAL_IP
fi

