#\!/bin/sh

ip=$1

service ssh start;
/sbin/iptables -I INPUT -s $ip -p tcp --dport 22 -j ACCEPT;

sleep 5;

sh /ssh_stop.sh $ip;
