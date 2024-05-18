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
* [Configuracion de VLANs](#configuracion-de-vlans)
* [Protocolo Spanning-Tree](#protocolo-spanning-tree)
* [Servidor de VLANs](#servidor-de-vlans)
* [Configuracion Etherchannel](#configuracion-etherchannel)

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

## Configuracion de VLANs

Las Redes de area Local Virtuales son una segmentacion del dominio de difusion capa 2 que se implementan para la separacion de dominios de Red, optimizacion de recursos y reduccion de costos de enlace, pero que a la vez agregan mayor complejidad a la topologia debido a que se pierde la comunicacion entre nodos y es necesario el enrutamiento para que esta se produzca entre segmentos.

1. switch(config)# __(vlan de datos)__
	* __vlan `<vlan-id>`__: submodo de configuracion de vlan
	* __name `<vlan>`__: establece el nombre de la vlan
2. switch(config)# __(vlan de administracion)__
	* __interface vlan `<vlan-id>`__: submodo de configuracion de interfaz (VLAN)
	* __ip address `<ip> <subnet mask>`__: define la direccion ip y mascara de subred.
3. switch(config)# __(definicion de enlaces)__
	* __interface `<fa0/1>`__: submodo de configuracion de interfaz (FastEthernet 0/1)
	* __switchport acces vlan `<vlan-id>`__: configura la interfaz en modo de acceso
	* __switchport mode trunk__: configura la interfaz en modo troncal
4. switch# __(verificacion de VLANs)__
	* __show vlan brief__: muestra las vlans configuradas con sus respectivas interfaces
	* __show interfaces trunk__ devuelve la configuracion de los enlaces troncales

## Protocolo spanning-tree

Los dispositivos administrables por defecto vienen con el protocolo de arbol de expansion activado, que se utiliza para prevenir los bucles a nivel de capa 2. Si bien en la mayoria de los casos no hace falta definir esta configuracion, en una red convergente o jerarquica es necesario para un funcionamiento eficiente.

1. switch(config)# __(configuracion global)__
    * __spanning-tree vlan `<vlan-id>` priority `<0-61440>`__: habilita el protocolo en la vlan seleccionada y establece el nivel de prioridad para definir el Root-Bridge entre los dispositivos que utilizan este protocolo.
    * __spanning-tree mode `<rapid-pvst>`__: define el modo de funcionamiento Rapido para disminuir el tiempo de convergencia de la topologia, debido a que se omiten las etapas de escucha y aprendizaje.
2. switch# __(verificacion spanning-tree)__
	* __show spanning-tree__: muestra la configuracion indicando el Bridge-Id del dispositivo y el Root-Bridge de cada VLAN
	* __show spanning-tree summary__ indica el estado de las interfaces fisicas (block, learning, listening, forwarding) de cada VLAN
	* __show spanning-tree detail__: devuelve la configuracion aplicada en cada interfaz fisica del dispositivo (cost, identifier, priority)

## Servidor de VLANs

Los dispositivos administrables por defecto vienen con el protocolo de arbol de expansion activado, que se utiliza para prevenir los bucles a nivel de capa 2. Si bien en la mayoria de los casos no hace falta definir esta configuracion, en una red convergente o jerarquica es necesario para un funcionamiento eficiente.

1. switch(config)# __(configuracion servidor)__
    * __vtp mode `<server>`__: establece al dispositivo como servidor de VLANs
    * __vtp domain `<domain>`__: define el dominio a compartir por BPDU para la Topologia
    * __vtp password `<password>`__: contraseña para el acceso de la configuracion
2. switch# __(configuracion modo privilegiado)__
    * __vlan database__: accede al archivo 'vlan.dat'de la memoria flash
    * __vlan `<vlan-id>` name `<name>`__: crea la vlan y le asigna el nombre indicado
3. switch(config)# __(mas configuraciones)__
    * __vtp mode `<client>`__: configura del dispositivo para recibir configuraciones
    * __vtp mode `<transparent>`__: configuracion que ignora las BPDUs del servidor

## Configuracion Etherchannel

Tecnologia que permite agrupar multiples enlaces redundantes de una misma conexion para que funcionen como uno solo y cuyo ancho de banda final se convierte en la sumatoria de estos. La cantidad maxima de interfaces que se pueden utilizar por grupo es de 8.

1. switch(config)# __(asignacion de enlaces)__
    * __interface `port-channel <1-48>`__ Submodo de configuracion de Etherchannel
    * __interface range `<GigabitEthernet 1/0/1-8>`__ Accede al modo de configuracion de rango
    * __channel-group `<1-48>` mode `<on>`__ Habilitar Etherchannel incondicionalmente
2. switch(config-if-range)# __(Port aggregation Protocol)__
    * __channel-protocol `<PAgP>`__ Prepara la interfaz para funcionar con PAgP (Protocolo propietario de CISCO)
    * __mode `<auto>`__ Habilita PAgP cuando se detecta un dispositivo compatible
    * __mode `<desirable>`__ Implementa PAgP incondicionalmente
3. switch(config-if-range)# __(Link aggregation Control Protocol)__
    * __channel-protocol `<LACP>`__ Prepara la interfaz para funcionar con LACP (Protocolo de Estandar abierto)
    * __mode `<passive>`__ Habilita LACP cuando se detecta un dispositivo compatible
    * __mode `<active>`__ Implementa LACP incondicionalmente
