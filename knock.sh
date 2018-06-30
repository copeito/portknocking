#\!/bin/sh

ip=172.17.0.2

#for x in 9000 8000 7000 22; do nmap -Pn --host_timeout 201 --max-retries 0 -p $x $ip; done; 
for x in 7000 8000 9000 22; do nmap -Pn --host_timeout 201 --max-retries 0 -p $x $ip; done; 
