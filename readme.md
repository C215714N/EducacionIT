# CCNA1 - Fundamentos de Red
## Tabla de Contenidos
* [Configuracion Inicial](#configuracion-inicial)
* [Configuracion de acceso remoto](#configuracion-de-acceso-remoto)
* [Ejercicios](#ejercicios)

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

## Verificacion de Interfaces
1. switch(config)# __(dispositivo a nivel de capa 2)__
	* __show arp__ Muestra las direcciones ip asociadas a las mac address a travez del protocolo ARP (configuracion capa 3 necesaria)
	* __show mac address-table__ Muestra las direcciones fisicas asociadas a las interfaces del dispositivo
2. router(config)# __(dispositivo a nivel de capa 3)__
	* __show ip interface brief__ Muestra un resumen de la configuracion de capa 3 de las interfaces del dispositivo.
	* __show interface `<gigabitEthernet 0/0>`__ Muestra informacion detallada sobre el funcionamiento de la interfaz

## Ejercicios
### Sistema Binario
1. Expresar las siguientes direcciones con notacion binaria, separando con puntos cada grupo de octetos (bytes)
>	1. 104.244.42.65
>	1. 31.13.94.35
>	1. 72.163.4.185
>	1. 54.225.94.212

2. Convertir las siguientes direcciones a expresion decimal
>	1. **00011111**.**00001101**.**01011110**.**10101110**
>	1. **10000111**.**11110101**.**01000111**.**00011011**
>	1. **10011000**.**00000100**.**11101100**.**10101110**
