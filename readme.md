# Switching & Routing

Esto es una guia para los alumnos de la capacitacion __ccna2__ que cursan los dias _sabados de 10h a 13hs_, donde podran acceder al contenido trabajado durante las clases y realizar actividades.

## Herramientas

* [Packet Tracer](https://skillsforall.com/resources/lab-downloads?userLang=es-XL&courseLang=en-US)
* [PuTTY](https://putty.org)

## Tabla de Contenidos

* [Configuracion Inicial](#configuracion-inicial)
* [Configuracion de Acceso Remoto](#configuracion-de-acceso-remoto)
* [Verificacion de la Topologia](#verificacion-de-topologia)
* [Identificacion de Dispositivos](#identificacion-de-dispositivos)

## Configuracion Inicial

Cuando configuramos un dispositivo de internetworks por primera vez, debemos hacerlo utilizando el *cable de consola (RS-232)* ya que se se encuentra por fuera de la banda de red y solamente podemos acceder a su configuracion utilizando este elemento.

1. Switch> (modo estandar)
	* __enable__: habilita el modo privilegiado
2. Switch# (modo privilegiado)
	* __configure terminal__: accede al modo de configuracion global
3. Switch(config)# (modo configuracion global)
	* __hostname `<name>`__: define el nombre del dispositivo
	* __ip domain name `<domain>`__: define el nombre de dominio al que pertenece el dispositivo.
	* __banner motd `#message#`__: establece el mensaje de acceso necesario para cuestiones legales

## Configuracion de Acceso Remoto

Una vez finalizada la configuracion inicial, podremos acceder al dispositivo utilizando protocolos de red como _TELNET_ o _SSH_, siempre y cuando hayamos establecido una __direccion IP__ un nombre de __dominio__ y una __puerta de enlace predeterminada__ para conectarnos remotamente.

1. switch(config)# (modo de configuracion global)
	* __username `<user>` password `<pass>`__: define un nombre de usuario y contraseña
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

## Verificacion de Topologia

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

## Identificacion de Dispositivos

Cuando trabajamos en una red previamente configurada y no disponemos de documentacion o simplemente necesitamos corroborar que dispositivos estan conectados en las diferentes interfaces de red, disponemos de __protocolos de CAPA 2__ que permiten a los dispositivos de internetworks intercambiar informacion utilizando tramas que se envian periodicamente, _compartiendo la informacion del enlace_.

1. switch(config)# __(Protocolos nivel de capa 2)__
	* __cdp run__: Habilita Cisco Discovery Protocol
	* __lldp run__: Habilita Link Layer Discovery Protocol
2. switch(config-if)# __(Configuracion LLDP)__
	* __lldp transmit__: Habilita el envio de tramas LLDP (compartir datos)
	* __lldp receive__: Habilita la recepcion de tramas LLDP (procesar datos)
3. switch(config-if)# __(verificacion de vecinos)__
	* __show cdp neighbors__: Muestra los dispositivos identificados mediante CDP
	* __show lldp neighbors__: Muestra los dispositivos identificados meidante LLDP
