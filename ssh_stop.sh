ip=$1;

service ssh stop;

if [ $ip ]
then
	/sbin/iptables -D INPUT -s $ip -p tcp --dport 22 -j ACCEPT;
else
	iptables -L --line-numbers | grep -E "ssh$" | cut -d' ' -f1 | xargs -i iptables -D INPUT {}
fi
