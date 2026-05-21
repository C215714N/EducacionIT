# NAT

__Network Address Translation__ es un mecanismo utilizado por los routers para cambiar paquetes entre dos redes que asignan mutuamente direcciones incompatibles y se implementa generalmente para la comunicacion de redes privadas con redes publicas. Surge como una solucion al problema de agotamiento de direcciones en IPv4 y puede implementarse de diferentes maneras como _estatica_, cuando la traduccion se realiza individualmente, _dinamica_, cuando se asigna una lista de direcciones a traducir, y con _sobrecarga_ donde ademas se asocia un numero de puerto para seguir la comunicacion.

1. router(config)# __(definicion de direcciones)__
    * __ip nat inside source static `<local ip>` `<global ip>`__: define la direccion que debe asignarse a la ip privada
    * __ip nat pool `<WORD>` `<start ip>` `<end ip>` netmask `<netmask>`__: define la lista de direcciones publicas
2. router(config)# __(asociacion dinamica)__
    * __ip nat inside source list `<WORD>` pool `<WORD>`__: define que ACL utilizar con la lista de direcciones NAT
    * __ip nat inside source list `<WORD>` interface `<interface-id>` overload__: habilita PAT indicando la interfaz de salida 
    * __ip nat inside source list `<WORD>` pool `<WORD>` overload__: implementa NAT Dinamico con sobrecarga
3. router(config-if)# __(asignacion de direcciones)__
    * __ip nat inside__: define la interfaz de trafico entrante que debera coincidir con la lista de direcciones LAN privadas
    * __ip nat outside__: define la interfaz de trafico saliente donde debera reemplazar las direcciones de origen con las WAN Publicas
4. router# __(verificacion de configuracion y traducciones)__
    * __show ip nat translations__: muestra la lista de paquetes, protocolos y puertos utilizados en las comunicaciones NAT
    * __show ip nat statistics__: muestra un resumen de las estadisticas y configuracion NAT del dispositivo

## Implementacion

Ejemplo de configuracion de NAT con sobrecarga (PAT) utilizando una interfaz de salida.

```sh
! Definicion del trafico interno (LAN)
access-list 1 permit 192.168.10.0 0.0.0.255
!
! Configuracion de la traduccion dinamica con sobrecarga (overload)
! Se asocia la ACL 1 con la interfaz de salida WAN
ip nat inside source list 1 interface GigabitEthernet0/1 overload
!
! Identificacion de interfaces
interface GigabitEthernet0/0
 description LAN_PRIVATE
 ip address 192.168.10.1 255.255.255.0
 ip nat inside
!
interface GigabitEthernet0/1
 description WAN_PUBLIC
 ip address 200.1.1.1 255.255.255.252
 ip nat outside
```

[volver](../readme.md)