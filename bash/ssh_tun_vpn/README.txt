
## How to create a simple vpn using ssh tun forwarding
Preparation:
1. First permit tunnel on remote server.
In sshd_config:
PermitTunnel yes

And restart sshd

2. ssh-keygen and put id_rsa.pub to your remote host's authorized_keys


Steps:
1. set up ssh tun forward
ssh -f -w 3:3  <your remote ip> true

2. change vars according to your internal and external config

3. run  ./keep_vpn.sh and the vpn should be running 



## How it works

0. First permit tunnel on remote server.
In sshd_config:
PermitTunnel yes

And restart sshd

1. set up ssh tun forward
ssh -f -w 3:3  <your remote ip> true

It will create 2 tun3 interfaces on  local machine and remote machine. 
The 2 interfaces is now connected. You need to set ip for them

2. Set private ip to each tun3
Suppose local IP 10.10.11.1， remote IP 10.10.11.2
local Machine: ip addr add dev tun3 10.10.11.1 
remote Machine: ip addr add dev tun3 10.10.11.2 

Then setup routes, the 2 IP can ping each other
Local machine：
    ip route add 10.10.11.0/24 dev tun3

Remote machine：
    ip route add 10.10.11.0/24 dev tun3

3. Set default gw on local machine to remote peer IP execept your remote IP
Local machine:
   ip route del default
   ip route add default via 10.10.11.2 dev tun3
   ip route add <your remote ip> via 192.168.1.1 dev eth7

4. Possibly add SNAT masquerade on remote machines external IF
Remote machine:
   iptables -t nat -A POSTROUTING -o $EXTERNAL_IF -j SNAT --to-source EXTERNAL_IP
   
