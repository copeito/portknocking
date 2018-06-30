#\!/bin/sh
#--privileged da acceso a modificar reglas iptables
docker run --privileged -v /home/copeito/Projects/portknocking/etc/knockd.conf:/etc/knockd.conf -it portknocking  
