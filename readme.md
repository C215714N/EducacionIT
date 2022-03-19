# CCNA2 - Routing & Switching

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

## Configuracion de VLAN
Las Redes de area Local Virtuales son una segmentacion del dominio de difusion capa 2 que se implementan para la separacion de dominios de Red, optimizacion de recursos y reduccion de costos de enlace, pero que a la vez agregan mayor complejidad a la topologia debido a que se pierde la comunicacion entre nodos y es necesario el enrutamiento para que esta se produzca entre segmentos.

1. switch(config)# __(VLAN DE DATOS)__
	* __vlan `<vlan-id>`__: submodo de configuraciond de vlan
	* __name `<vlan>`__: establede el nombre de la vlan
2. switch(config)# __(VLAN DE ADMINISTRACION)__
	* __interface vlan `<vlan-id>`__: submodo de configuracion de interfaz (VLAN)
	* __ip address `<ip> <subnet mask>`__: define la direccion ip y mascara de subred.
3. switch(config)# __(DEFINICION DE ENLACES)__
	* __interface `<fa0/1>`__: smodo de configuracion de interfaz (FastEthernet 0/1)
	* __switchport acces vlan `<vlan-id>`__: configura la interfaz en modo de acceso
	* __switchport mode trunk__: configura la interfaz en modo troncal
