# CCNA2 - Routing & Switching
## Tabla de contenidos
1. [Configuracion Inicial](#configuracion-inicial)
2. [Configuracion de Acceso Remoto](#configuracion-de-acceso-remoto)
3. [Identificacion de Dispositivos](#identificacion-de-dispositivos)
4. [Configuracion de VLANs](#configuracion-de-vlans)

## Configuracion Inicial
Cuando configuramos un dispositivo de internetworks por primera vez, debemos hacerlo utilizando el *cable de consola (RS-232)* ya que se se encuentra por fuera de la banda de red y solamente podemos acceder a su configuracion utilizando este elemento.

1. Switch> __(modo estandar)__
	* __enable__: habilita el modo privilegiado
2. Switch# __(modo privilegiado)__
	* __configure terminal__: accede al modo de configuracion global
3. Switch(config)# __(modo configuracion global)__
	* __hostname `<name>`__: define el nombre del dispositivo
	* __banner motd `#message#`__: establece el mensaje de acceso necesario para cuestiones legales

## Configuracion de Acceso Remoto
Una vez finalizada la configuracion inicial, podremos acceder al dispositivo utilizando protocolos de red como _TELNET_ o _SSH_, siempre y cuando hayamos establecido una __direccion IP__ un nombre de __dominio__ y una __puerta de enlace predeterminada__ para conectarnos remotamente.

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

## Identificacion de Dispositivos
Cuando trabajamos en una red previamente configurada y no disponemos de documentacion o simplemente necesitamos corroborar que dispositivos estan conectados en las diferentes interfaces de red, disponemos de protocolos de CAPA 2 que permiten a los dispositivos de internetworks intercambiar informacion utilizando tramas que se envian periodicamente, compartiendo la informacion del enlace.

1. switch(config)# __(Protocolos nivel de capa 2)__
	* __cdp run__: Habilita Cisco Discovery Protocol
	* __lldp run__: Habilita Link Layer Discovery Protocol
2. switch(config-if)# __(Configuracion LLDP)__
	* __lldp transmit__: Habilita el envio de tramas LLDP (compartir datos)
	* __lldp receive__: Habilita la recepcion de tramas LLDP (procesar datos)
3. switch(config-if)# __(verificacion de vecinos)__
	* __show cdp neighbors__: Muestra los dispositivos identificados mediante CDP
	* __show lldp neighbors__: Muestra los dispositivos identificados meidante LLDP

## Configuracion de VLANs
Las Redes de area Local Virtuales son una segmentacion del dominio de difusion capa 2 que se implementan para la separacion de dominios de Red, optimizacion de recursos y reduccion de costos de enlace, pero que a la vez agregan mayor complejidad a la topologia debido a que se pierde la comunicacion entre nodos y es necesario el enrutamiento para que esta se produzca entre segmentos.

1. switch(config)# __(vlan de datos)__
	* __vlan `<vlan-id>`__: submodo de configuraciond de vlan
	* __name `<vlan>`__: establede el nombre de la vlan
2. switch(config)# __(vlan de administracion)__
	* __interface vlan `<vlan-id>`__: submodo de configuracion de interfaz (VLAN)
	* __ip address `<ip> <subnet mask>`__: define la direccion ip y mascara de subred.
3. switch(config)# __(definicion de enlaces)__
	* __interface `<fa0/1>`__: smodo de configuracion de interfaz (FastEthernet 0/1)
	* __switchport acces vlan `<vlan-id>`__: configura la interfaz en modo de acceso
	* __switchport mode trunk__: configura la interfaz en modo troncal
