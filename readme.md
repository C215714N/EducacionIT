# Switching and Routing

Esto es una guia para los alumnos de la capacitacion __CCNA2__ que cursan los dias _miercoles y viernes de 20hs a 22hs_, donde podran descargar y repasar el contenido trabajado durante las clases.

## Herramientas (Software)
* [Packet Tracer](https://skillsforall.com/resources/lab-downloads?userLang=es-XL)
* [Wireshark](https://wireshark.org)
* [PuTTY](https://putty.org)

## Tabla de contenidos
1. [Configuracion Inicial](#configuracion-inicial)
1. [Configuracion de Acceso Remoto](#configuracion-de-acceso-remoto)
___

## Configuracion Inicial

Cuando configuramos un dispositivo de internetworks por primera vez, debemos hacerlo utilizando el *cable de consola (RS-232)* ya que se se encuentra por fuera de la banda de red y solamente podemos acceder a su configuracion utilizando este elemento y un software _emulador de terminal_ para ver la respuesta del dispositivo.

1. Switch> __(modo estandar)__
	* __enable__: habilita el modo privilegiado
2. Switch# __(modo privilegiado)__
	* __configure terminal__: accede al modo de configuracion global
3. Switch(config)# __(modo configuracion global)__
	* __hostname `<name>`__: define el nombre del dispositivo
	* __banner motd `#message#`__: establece el mensaje de acceso necesario para cuestiones legales

## Configuracion de Acceso Remoto

Una vez finalizada la configuracion inicial, debemos establecer una __direccion IP__ en alguna de las interfaces del dispositivo, un nombre de __dominio__ y una __puerta de enlace predeterminada__ para poder conectarnos remotamente al mismo utilizando protocolos de red como _TELNET_ o _SSH_. Ademas debemos definir el tipo de acceso y protocolo de conexion a utilizar.

1. switch(config)# __(modo de configuracion global)__
	* __username `<user>` password `<pass>`__: define un nombre de usuario y contraseña
	* __ip domain name `<domain>`__: define el nombre de dominio al que pertenece el dispositivo.
	* __crypto key generate rsa__: define una clave publica para conexiones SSH.
2. switch(config-line)# __(submodo de configuracion de linea)__
	* __line `<console 0>`__: submodo de configuracion de lineas de consola
	* __login local__: habilita el inicio de sesion por contraseña
3. switch(config-line)# __(submodo de configuracion de linea)__
	* __line `<vty 0 15>`__: submodo de configuracion de lineas virtuales
	* __transport input ssh__: habilita el acceso exclusivo por SSH
4. switch(config-if) __(submodo de configuracion de interfaz)__
	* __interface `<vlan 1>`__: submodo de configuracion de interfaz (VLAN 1)
	* __ip address `<ip> <subnet mask>`__: define la direccion ip y mascara de subred.
	* __no shutdown__: enciende la interfaz seleccionada.
