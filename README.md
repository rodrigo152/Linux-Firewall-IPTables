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

<img width="819" height="693" alt="image" src="https://github.com/user-attachments/assets/72bc0a3c-4e31-4537-ab23-05d4a787427f" />
<img width="822" height="687" alt="image" src="https://github.com/user-attachments/assets/5203f66f-e29c-4497-9aef-477de0835481" />
<img width="1636" height="697" alt="image" src="https://github.com/user-attachments/assets/12da54cf-c5f5-499b-80cb-71d5d14e44e6" />

