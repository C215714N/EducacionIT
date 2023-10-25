# Switching and Routing

Esto es una guia para los alumnos de la capacitacion __CCNA2__ que cursan los dias _miercoles y viernes de 20hs a 22hs_, donde podran descargar y repasar el contenido trabajado durante las clases.

## Herramientas (Software)
* [Packet Tracer](https://skillsforall.com/resources/lab-downloads?userLang=es-XL)
* [Wireshark](https://wireshark.org)
* [PuTTY](https://putty.org)

## Tabla de contenidos
1. [Configuracion Inicial](#configuracion-inicial)
1. [Configuracion de Acceso Remoto](#configuracion-de-acceso-remoto)
1. [Definicion de VLANs](#definicion-de-vlans)
1. [Protocolo spanning-tree](#protocolo-spanning-tree)
1. [Servidor de VLANs](#servidor-de-vlans)
1. [Protocolo Etherchannel](#protocolo-etherchannel)
1. [Configuracion HSRP](#configuracion-hsrp)
1. [Direccionamiento IPv6 con DHCP](#direccionamiento-ipv6-con-dhcp)
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

## Definicion de VLANs

Una __Red de area Local Virtual__ es una _segmentacion del dominio de difusion capa 2_ que se implementa para la _separacion de dominios de Red, optimizacion de recursos y reduccion de costos de enlace_, pero que a la vez agregan mayor complejidad a la topologia debido a que __se pierde la comunicacion entre nodos y es necesario el enrutamiento__ para que esta se produzca entre segmentos.

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

## Protocolo spanning-tree

Los dispositivos administrables por defecto vienen con el __protocolo de arbol de expansion__ activado, que se utiliza para _prevenir los bucles a nivel de capa 2_. Si bien en la mayoria de los casos no hace falta definir esta configuracion, en una __red convergente o jerarquica__ es necesario para un _funcionamiento eficiente_.

1. switch(config)# __(configuracion global)__
	* __spanning-tree vlan `<vlan-id>` priority `<0-61440>`__: habilita el protocolo en la vlan seleccionada y establece el nivel de prioridad para definir el Root-Bridge.
	* __spanning-tree mode `<rapid-pvst>`__: define el modo de funcionamiento Rapido para disminuir el tiempo de convergencia de la topologia.
1. switch# __(verificacion de la topologia)__
	* __show spanning-tree__

## Servidor de VLANs

__VLAN Trunking Protocol__ es un protocolo propietario de CISCO, utilizado para _configurar y administrar VLANs_. Permite _centralizar y simplificar_ la administración en un dominio, pudiendo _crear, borrar y renombrar_ las VLANs, reduciendo así la necesidad de configurarlas en todos los nodos. Al cambiar la configuración de las VLANs en el switch en modo servidor y al realizar cambios, estos se distribuyen a los demás dispositivos del dominio VTP a través de los enlaces permitidos.

1. switch(config)# __(configuracion servidor)__
	* __vtp mode `<server>`__: establece al dispositivo como servidor de VLANs
	* __vtp domain `<domain>`__: define el dominio a compartir por BPDU para la Topologia
	* __vtp password `<password>`__: contraseña para el acceso de la configuracion
2. switch# __(configuracion modo privilegiado)__
	* __vlan database__: accede al archivo 'vlan.dat'de la memoria flash
	*	__vlan `<vlan-id>` name `<name>`__: crea la vlan y le asigna el nombre indicado
3. switch(config)# __(mas configuraciones)__
	*	__vtp mode `<client>`__: configura del dispositivo para recibir configuraciones
	* __vtp mode `<transparent>`__: configuracion que ignora las BPDUs del servidor

## Configuracion Etherchannel

Identificada tambien como __Channel-Group__, es una tecnologia que permite __agrupar multiples enlaces redundantes__ de una misma conexion, para que funcionen como uno solo y cuyo ancho de banda final se convierte en la sumatoria de estos. La _cantidad maxima de interfaces_ que se pueden utilizar _por grupo es de 8_ y las mismas deben ser del mismo tipo para que funcione correctamente.

1. switch(config)# __(asignacion de enlaces)__
	* __interface `port-channel <1-48>`__ Submodo de configuracion de Etherchannel
	* __interface range `<GigabitEthernet 1/0/1-8>`__ Accede al modo de configuracion de rango
	* __channel-group `<1-48>` mode `<on>`__ Habilitar Etherchannel incondicionalmente
2. switch(config-if-range)# __(Port Agregation Protocol)__
	* __channel-protocol `<PAgP>`__ Prepara la interfaz para funcionar con PAgP (Protocolo propietario de CISCO)
	* __mode `<auto>`__ Habilita LACP cuando se detecta un dispositivo compatible
	* __mode `<desirable>`__ Implementa PAgP incondicionalmente
3. switch(config-if-range)# __(Link Agregation Control Protocol)__
	* __channel-protocol `<LACP>`__ Prepara la interfaz para funcionar con LACP (Protocolo de Estandar abierto)
	* __mode `<passive>`__ Habilita LACP cuando se detecta un dispositivo compatible
	* __mode `<active>`__ Implementa LACP incondicionalmente

## Configuracion de HSRP

El __Protocolo de Enrutamiento redundante__ permite la creacion _un grupo de routers (cluster)_ donde _uno funciona como maestro_, enrutando el tráfico, y _los demás sirven de respaldo_ en caso que se produzca un __fallo en el maestro__. Funciona a nivel de capa 3 administrando las direcciones virtuales que identifican al router que actúa como maestro en un momento dado.

1. router(config-if)# __(configuracion de interfaz)__
	* __ip address `<192.168.0.2> <255.255.255.0>`__ establece la direccion de la interfaz
	* __standby ip `<192.168.0.1>`__ define la direccion del router virtual HSRP.
	* __standby track `<gigabitEthernet 0/0>`__ realiza seguimiento de la interfaz de salida
	* __standby preempt__ reduce la prioridad cuando la interfaz de salida falla

## Direccionamiento IPv6 con DHCP

Si bien IPv6 resuelve la __auto configuración__ de direcciones, el __Protocolo de configuracion de Host Dinamico__​ le brinda más control al administrador sobre las asignaciones, mayor amplitud en la configuración de servicios y puede trabajar de forma conjunta con _stateless_. El administrador de red determina que procesos se van a emplear a través de los mensajes __RA de ICMPv6__.

1. router(config-if)# __(StateLess Address Auto Configuration)__
	* __ipv6 enable__ Habilita el protocolo IPv6 en la interfaz seleccionada
	* __ipv6 address `<2002:acad:db6::1/64>`__ Establece la direccion y el prefijo para el enrutamiento
	* __ipv6 address `<fe80::01>` link-local__ Define la direccion de enlace local para la comunicacion LAN
	* __ipv6 unicat-routing__ Habilita el enrutamiento de paquetes IPv6 y mensajes Router Advertisement
2. router(config-dhcp) __(Configuracion DHCP StateLess)__
	* __ipv6 dhcp pool `<pool-name>`__ Crea un Pool DHCP con el nombre indicado
	* __dns-server `<ipv6-address>`__ Establece la direccion del Servidor de Nombres
	* __domain-name `<network-domain>`__ Define el nombre de Dominio de la topologia
