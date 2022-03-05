# CCNA2 - Routing & Switching

## configuracion inicial

* Switch> (modo estandar)
	* __enable__: habilita el modo privilegiado
* Switch# (modo privilegiado)
	* __configure terminal__: accede al modo de configuracion global
* Switch(config)# (modo configuracion global)
	* __hostname `<name>`__: define el nombre del dispositivo
	* __username `<user>` password `<pass>`__: define un nombre de usuario y contraseña
	* __ip domain name `<domain>`__: define el nombre de dominio al que pertenece el dispositivo.
	* __crypto key generate rsa__: define una clave publica para conexiones SSH.
	* __line console 0__: submodo de configuracion de linea de consola
		* __login local__: habilita el inicio de sesion por contraseña
	* __line vty 0 15__: submodo de configuracion de lineas virtuales
		* __transport input ssh__: habilita el acceso exclusivo por SSH
	* __interface `<vlan 1>`__: submodo de configuracion de interfaz (VLAN 1)
		* __ip address `<ip> <subnet mask>`__: define la direccion ip y mascara de subred.
		* __no shutdown__: enciende la interfaz seleccionada.
