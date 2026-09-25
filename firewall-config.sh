#!/bin/bash
# Limpiar reglas previas
sudo iptables -F
sudo iptables -t nat -F

# Habilitar reenvío de paquetes (NAT)
sudo sysctl -w net.ipv4.ip_forward=1

# Configurar NAT para salida a Internet
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE

# Reglas por defecto
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP

# Permitir SSH, Loopback y Conexiones establecidas
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Permitir tráfico de LAN a Internet
sudo iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
sudo iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Bloquear Telnet y HTTP
sudo iptables -A INPUT -p tcp --dport 23 -j DROP
sudo iptables -A INPUT -p tcp --dport 80 -j DROP