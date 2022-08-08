# Fundamentos de Redes

Esto es una guia practica realizada para los alumnos del curso de CCNA1_(Cisco Certified Network Associated)_ con la finalidad de reforzar los conceptos vistos en clase y para que puedan practicar las diferentes actividades provistas por la plataforma [Alumni](https://alumni.education)

## Tabla de contenidos
* [Introduccion](#introduccion)
* [Configuracion Inicial](#configuracion-inicial)
* [Configuracion de Acceso Remoto](#configuracion-de-acceso-remoto)
* [Enrutamiento Estatico](#enrutamiento-estatico)

## Ejercicios
* [Sistema Binario](./ejercicios/binary-decimal.md)
* [Sistema Hexadecimal](./ejercicios/hexadecimal.md)
* [Capa 3 (Red)](./ejercicios/ip.md)
* [Subneting](./ejercicios/subnetting.md)

## Introduccion
* [Packet Tracer](https://skillsforall.com/resources/lab-downloads)
* [Wireshark](https://www.wireshark.org/)
* [Skills for All](https://skillsforall.com/)
* [PuTTY](https://putty.org/)

## configuracion inicial
Cuando configuramos un dispositivo de internetworks por primera vez, debemos hacerlo utilizando el *cable de consola (RS-232)* ya que se se encuentra por fuera de la banda de red y solamente podemos acceder a su configuracion utilizando este elemento.

1. Switch> (modo estandar)
	* __enable__: habilita el modo privilegiado
2. Switch# (modo privilegiado)
	* __configure terminal__: accede al modo de configuracion global
3. Switch(config)# (modo configuracion global)
	* __hostname `<name>`__: define el nombre del dispositivo
	* __banner motd `#message#`__: establece el mensaje de acceso necesario para cuestiones legales

## configuracion de acceso remoto
Una vez finalizada la configuracion inicial, podremos acceder al dispositivo utilizando protocolos de red como _TELNET_ o _SSH_, siempre y cuando hayamos establecido una __direccion IP__ un nombre de __dominio__ y una __puerta de enlace predeterminada__ para conectarnos remotamente.

1. switch(config)# (modo de configuracion global)
	* __username `<user>` password `<pass>`__: define un nombre de usuario y contraseña
	* __ip domain name `<domain>`__: define el nombre de dominio al que pertenece el dispositivo.
	* __crypto key generate rsa__: define una clave publica para conexiones SSH.
2. switch(config-line)# (submodo de configuracion de linea)
	* __line `<console 0>`__: submodo de configuracion de lineas de consola
	* __login local__: habilita el inicio de sesion por contraseña
3. switch(config-line)# (submodo de configuracion de linea)
	* __line `<vty 0 15>`__: submodo de configuracion de lineas virtuales
	* __transport input ssh__: habilita el acceso exclusivo por SSH
4. switch(config-if) (submodo de configuracion de interfaz)
	* __interface `<vlan 1>`__: submodo de configuracion de interfaz (VLAN 1)
	* __ip address `<ip> <subnet mask>`__: define la direccion ip y mascara de subred.
	* __no shutdown__: enciende la interfaz seleccionada.

## Verificaciones de Topologia
Cuando establecemos la configuracion de los dispositivos de internetworks debemos verificar el funcionamiento de las interfaces, redes y dispositivos a los que se conecte dentro de la topologia. La misma dependera del tipo de dispositivo que estemos administrando.

1. switch# (administracion general)
	* __show version__: Informacion del Sistema Operativo y version
	* __show flash__: Lista de archivos de la memoria FLASH
	* __show running-config__: Configuracion actual almacenada en la RAM
	* __show startup-config__: Configuracion de inicio almacenada en la NVRAM
1. switch# (administracion del conmutador)
	* __show interfaces status__: Interfaces del dispositivo con su configuracion capa 2 resumida
	* __show interfaces `<interface id>`__: Detalle el funcionamiento de la interfaz seleccionada
	* __show mac address-table__: Tabla de direcciones MAC registradas por interfaz
1. router# (administracion del enrutador)
	* __show arp__: Tabla de direcciones IP aprendidas con sus MAC correspondientes
	* __show ip interfaces brief__: Interfaces del dispositivo con su configuracion capa 3 resumida
	* __show ip route__: Tabla de rutas a las que esta conectado o se puede acceder

## Enrutamiento Estatico
Al configurar las redes dentro de la topologia debemos indicar al router como llegar a las redes vecinas, ya que los dispositivos de interconexion solamente reconocen las redes configuradas y que se encuentren conectadas directamente.

1. router(config-if)# (Configuracion de la Red Local)
	* __interface `gigabitEthernet 0/0`__ Accedemos al submodo de configuracion de Interfaz
	* __ip address `192.168.0.1 255.255.255.0`__ Direccion IP de la interfaz para configurar la red
2. router(config)# (Definicion de rutas Estaticas)
	* __ip route `<network>` `<subnet mask>` `<next hop>`__ Definicion de Ruta estatica a una red remota
	* __ip route `192.168.10.0` `255.255.255.0` `10.0.0.1`__ Ruta estatica a la red "192.168.10.0" a traves de 10.0.0.1
	* __ip route `0.0.0.0` `0.0.0.0` `172.20.0.2`__ Ruta predeterminada para cuando no existan coincidencias de paquetes

## Configuracion IPv6
El protocolo de Internet version 6 viene desactivado de manera predeterminada, por lo tanto deberemos activar el dispositivo como enrutador y configurar dicho protocolo en sus respectivas interfaces para que funcione correctamente dentro de la topologia.

1. router(config-if)# (Configuracion de interfaz IPv6)
	* __ipv6 enable__ Habilita el protocolo en la interfaz
	* __ipv6 address `2001:DB6:ACAD:1::1`/`64`__ Direccion global con un prefijo (enrutable a traves de internet)
	* __ipv6 address `fe80::1` `link-local`__ Direccion de enlace local para comunicacion privada (no enrutable)
1. router(config)#
	* __ipv6 unicast-routing__ Habilita el enrutamiento IPv6
	* __ipv6 route `2001:db8:acad::/64 3000::1`__ Enrutamiento estatico IPv6
	* __IPv6 Unicast Routing__
