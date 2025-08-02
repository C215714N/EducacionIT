# Configuracion de Acceso Remoto

Una vez finalizada la configuracion inicial, podremos acceder al dispositivo utilizando protocolos de red como _TELNET_ o _SSH_, siempre y cuando hayamos establecido una __direccion IP__ un nombre de __dominio__ y una __puerta de enlace predeterminada__ para conectarnos remotamente.

1. switch(config)# __(modo de configuracion global)__
    * __username `<user>` password `<pass>`__: crea un usuario y contraseña local.
    * __crypto key generate rsa__: establece las claves de acceso para conexiones SSH.
2. switch(config-line)# __(submodo de configuracion de linea)__
    * __line `<line-type>`__: Accede al submodo de configuracion
    * __login local__: habilita el inicio de sesion por contraseña
    * __transport input ssh__: habilita el acceso exclusivo por SSH
4. switch(config-if) __(submodo de configuracion de interfaz)__
    * __interface `<interface-id>`__: Ingresa al submodo de configuracion de interfaz
    * __ip address `<ip> <subnet mask>`__: define la direccion ip y mascara de subred.
    * __no shutdown__: enciende la interfaz seleccionada.

## Implementacion

Para acceder remotamente es necesaria una __direccion IP__ y una _ruta predeterminada (default-gateway)_, variando solamente el __tipo de interfaz__ a configurar en un __switch (virtual) o un router (fisica)__. En este caso se muestra la configuracion de un _usuario y contraseña_, ademas de una contraseña para el acceso al _modo privilegiado_.

```sh
enable secret Qej8h8w54q594$
username c215714n! password VtodyosmD48w58qh#
!
! Interfaz Fisica del Router (LAN)
interface Gi0/0 
ip address 10.0.0.1 255.255.255.0
no shutdown
!
! Acceso por Linea de consola
line console 0 
login local
!
! Acceso remoto (Virtual TeleType)
line vty 0 15 
login local
transport input ssh
```

[volver](../readme.md)