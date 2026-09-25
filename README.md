- Firewall Perimetral y Enrutamiento NAT con IPTables en Linux 

Implementación y configuración de un firewall de red a nivel de sistema operativo utilizando Ubuntu Server y herramientas nativas de Linux (IPTables) en un entorno virtualizado.

-  Objetivo del Proyecto
Configurar IPTables en un servidor Linux para que actúe como firewall perimetral, permitiendo la salida a Internet desde una LAN aislada mediante NAT, bloqueando servicios no autorizados y permitiendo únicamente la administración segura por SSH.

- Topología y Entorno Virtual
La arquitectura de red se diseñó de la siguiente manera:


       [ INTERNET ]
            │ 
            │ (NAT)
      ┌─────┴─────┐  (enp0s3: 10.0.2.15)
      │  UBUNTU   │  Firewall / IPTables
      │  SERVER   │  (Enrutador)
      └─────┬─────┘  (enp0s8: 192.168.10.1)
            │
      ======┴====================== (LAN: 192.168.10.0/24)
            │                  │
       ┌────┴────┐        ┌────┴────┐
       │ Cliente │        │ Cliente │
       │   01    │        │   02    │
       └─────────┘        └─────────┘
- El laboratorio se desplegó utilizando VirtualBox con una máquina virtual de Ubuntu Server 22.04 LTS configurada con doble interfaz de red:

Adaptador 1 (NAT): Conexión hacia Internet para la salida del tráfico.
Adaptador 2 (Red Interna): Interfaz asignada para la LAN aislada (192.168.10.0/24).
