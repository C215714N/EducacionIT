# Configuracion de VLANs

Las Redes de area Local Virtuales son una __segmentacion del dominio de difusion capa 2__ que se implementan para la _separacion de dominios de Red, optimizacion de recursos y reduccion de costos de enlace_, pero que a la vez agregan __mayor complejidad__ a la topologia debido a que se pierde la comunicacion entre nodos y es necesario el _enrutamiento_ para que esta se produzca entre segmentos.

1. switch(config)# __(vlan de datos)__
	* __vlan `<vlan-id>`__: submodo de configuracion de vlan
	* __name `<vlan>`__: establece el nombre de la vlan
2. switch(config)# __(vlan de administracion)__
	* __interface vlan `<vlan-id>`__: submodo de configuracion de interfaz (VLAN)
	* __ip address `<ip> <subnet mask>`__: define la direccion ip y mascara de subred.
3. switch(config)# __(definicion de enlaces)__
	* __switchport acces vlan `<vlan-id>`__: configura la interfaz en modo de acceso
	* __switchport mode trunk__: configura la interfaz en modo troncal
4. switch# __(verificacion de VLANs)__
	* __show vlan brief__: muestra las vlans configuradas con sus respectivas interfaces
	* __show interfaces trunk__ devuelve la configuracion de los enlaces troncales
5. router(config)# __(router on a stick)__
	* __interface `<if-id>`.`<sub-if>`__: crea e ingresa a una subinterfaz de enrutamiento 
	* __encapsulation `dot1Q` `<vlan-id>`__: Establece el protocolo 802.1Q con etiquetado de vlan
	* __ip address `<ip>` `<subnet-mas>`__: establece la direcion ip y mascara para la subinterfaz

## Implementacion

Para garantizar la __comunicacion entre los segmentos de red__, debemos verificar que todas _las VLAN hayan sido creadas_ en los dispositivos de la _capa de distribucion_, ya que de lo contrario, no se hara el etiquetado correspondiente y por lo tanto no tendremos comunicacion entre dichos nodos.

```sh
vlan 10
name ADMIN
vlan 20
name SALES
vlan 30
name GUEST
!
interface vlan 10
description VLAN DE ADMINISTRACION
ip address 10.0.0.226 255.255.255.224
no shutdown
!
interface range FastEthernet 0/1-4
switchport access vlan 10
description ADMIN
!
interface range FastEthernet 0/5-14
switchport access vlan 20
description SALES
!
interface range FastEthernet 0/15-24
switchport access vlan 30
description GUEST
!
interface range GigabitEthernet 0/1-2
switchport mode trunk
switchport trunk allowed vlan 10,20,30
description ENLACE TRONCAL
```

En caso de utilizar un __router para comunicar las vlans__ debemos configurar las _subinterfaces correspondientes_ y eliminar, en caso de ser necesario, cualquier configuracion ip de la interfaz fisica. Tambien deberemos _asignar el VLAN-ID_ apropiado para el __etiquetado de capa 2__.

```sh
interface GigabitEthernet 0/0.1
encapsulation dot1Q 10
ip address 10.0.0.225 255.255.255.224
description ADMIN
!
interface GigabitEthernet 0/0.2
encapsulation dot1Q 20
ip address 10.0.0.1 255.255.255.128
description SALES
!
interface GigabitEthernet 0/0.3
encapsulation dot1Q 30
ip address 10.0.0.129 255.255.255.192
description GUEST
!
interface GigabitEthernet 0/0
no shutdown
```

[volver](../readme.md)