# Fundamentos de Redes

Esto es una guia teorico-practica para los alumnos de la capacitacion CCNA1 que cursan los dias Lunes y Miercoles de 08hs a 10hs. Aqui podran realizar ejercicios complementarios al [Alumni](https://alumni.education) y repasar los contenidos vistos en clase.

## Programas 

* [Packet Tracer](https://skillsforall.com/resources/lab-downloads?userLang=es-XL&courseLang=en-US) 
* [Wireshark](https://wireshark.org)
* [PuTTY](https://putty.org/)
* [Driver Identifie](https://www.driveridentifier.com/blog/?p=149)


## Tabla de contenidos
* [Configuracion Inicial](#configuracion-inicial)
* [Configuracion Acceso Remoto](#configuracion-de-acceso-remoto)

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

## Enrutamiento Estatico
Al configurar las redes dentro de la topologia debemos indicar al router como llegar a las redes vecinas, ya que los dispositivos de interconexion solamente reconocen las redes configuradas y que se encuentren conectadas directamente.

1. router(config-if)# (Configuracion de la Red Local)
	* __interface `gigabitEthernet 0/0`__ Accedemos al submodo de configuracion de Interfaz
	* __ip address `192.168.0.1 255.255.255.0`__ Direccion IP de la interfaz para configurar la red
2. router(config)# (Definicion de rutas Estaticas)
	* __ip route `<network>` `<subnet mask>` `<next hop>`__ Definicion de Ruta estatica a una red remota
	* __ip route `192.168.10.0` `255.255.255.0` `10.0.0.1`__ Ruta estatica a la red "192.168.10.0" a traves de 10.0.0.1
	* __ip route `0.0.0.0` `0.0.0.0` `172.20.0.2`__ Ruta predeterminada para cuando no existan coincidencias de paquetes