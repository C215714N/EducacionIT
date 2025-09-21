# Servidor de VLANs

El __protocolo de Enlace Virtual__ es utilizado en _redes Cisco_ para la __gestión centralizada de VLANs__. Simplifica la administración de VLANs en redes grandes al permitir que la _creación, modificación y eliminación de VLANs_ se realice en un solo __switch servidor__ y luego se propague automáticamente a otros _switches clientes_, en el mismo dominio.

1. switch(config)# __(configuracion servidor)__
    * __vtp mode `<server>`__: establece al dispositivo como servidor de VLANs
    * __vtp domain `<domain>`__: define el dominio a compartir por BPDU para la Topologia
    * __vtp password `<password>`__: contraseña para el acceso de la configuracion
2. switch# __(modo privilegiado)__
    * __vlan database__: accede al archivo 'vlan.dat'de la memoria flash
    * __vlan `<vlan-id>` name `<name>`__: crea la vlan y le asigna el nombre indicado
3. switch(config)# __(otras configuraciones)__
    * __vtp mode `client`__: configura del dispositivo para recibir configuraciones
    * __vtp mode `transparent`__: configuracion que ignora las BPDUs del servidor

## Implementacion

Cuando utilizamos el _protocolo VTP_, los switches de la __capa de acceso__ se configuran en __modo cliente__ y luego se les asignan las vlan que utilizaran sus interfaces, aunque debemos tener en cuenta que las mismas _no se activaran_ hasta que no se actualice la __base de datos del servidor__.

```sh
vtp mode client
!
interface range FastEthernet 0/1-16
description SALES ACCESS
switchport access vlan 10
!
interface range FastEthernet 0/17-24
description GUEST ACCESS
switchport acces vlan 20
```

Una vez terminada la configuracion de los switches clientes, podremos configurar el __servidor de VLANs__, estableciendo el _dominio y los enlaces troncales_. Por ultimo creamos las VLANs y configuramos sus respectivas interfaces para que __los mensajes se distribuyan en el dominio__.

```sh
vlan database
vlan 10 name SALES
vlan 20 name GUEST
exit
!
configure terminal
vtp mode server
vtp domain ENTERPRISE.NET
vtp version 2
!
interface range GigabitEthernet 1/0/1-24
switchport mode trunk
```

[volver](../readme.md)