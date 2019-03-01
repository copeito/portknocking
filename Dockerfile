FROM debian:9
MAINTAINER copeito@gmail.com
LABEL Description="portknocking"

RUN apt-get update --fix-missing
RUN apt-get upgrade -y

# Instalación del servicio port knocking
RUN apt-get install -y knockd

# Instalación de herramientas necesarias
# iptables: Lo utiliza knockd acceder/denegar acceso
# iptables-persistent: Hace persistentes las reglas iptables aunque se 
#       reinicie la máquina. En docker no tiene mucho sentido pero lo 
#       instalo para dejar clara como sería la instalación de knockd en 
#       un servidor físico

RUN apt-get install -y openssh-server nano iptables 
RUN apt-get install -y linux-image-$(uname -r)

# Crea el usuario copeito
RUN useradd copeito -m 

# Prepara knockd para ser iniciado cada vez que arranque el sistema
# (no tiene sentido en docker pero sirve como nota para un servidor físico)
RUN sed -i "s/START_KNOCKD=0/START_KNOCKD=1/" /etc/default/knockd

EXPOSE 9000
EXPOSE 8000
EXPOSE 7000
EXPOSE 22

ADD start.sh /start.sh
ADD ssh_start.sh /ssh_start.sh
ADD ssh_stop.sh /ssh_stop.sh
ADD etc/knockd.conf /etc/knockd.conf

CMD "/start.sh"
