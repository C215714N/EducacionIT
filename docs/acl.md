# ACL

__Access Control List__ corresponde a una serie de reglas que determinan si un router reenvia o descarta un paquete segun la informacion que se encuentra en la cabecera, permitiendo controlar el flujo de trafico. El principal objetivo de las ACL es filtrar el trafico de red, pemitiendo o denegando el mismo en base a una condicion, de manera similar al funcionamiento de un _firewall_. Las mismas se aplican al trafico entran y saliente, no operando sobre los paquetes originados en el router.

1. router(config)# __(definicion de lista estandar)__
    * __access-list `<1-99>` `<action>` `<network>` `<wildcard>`__: regla que determina la accion que debe llevarse a cabo con los paquetes que coincidan con la red especificada.
    * __access-list `<1-99>` `<action>` host `<address>`__: establece la mascara wildcard _0.0.0.0_ que coincide solamente con la direccion indicada
    * __access-list `<1-99>` `<action>` any__: establece la mascara wildard _255.255.255.255_ que coincide con todos los paquetes recibidos
    * __ip access-list standard `<WORD>`__: crea una lista estandar nombrada e ingresa al modo de subconfiguracion ACL
    *
2. router(config)# __(definicion de lista extendida)__
    * __access-list `<100-199>` `<action>` `<protocol>` `<src-net>` `<dest-net>` [`<operator>` `<operand>`]__: regla que permite los paquetes de la red de origen a la red de destino que correspondan con el puerto y protocolo indicados
    * __access-list `100` permit `ospf` any any__: permite los paquetes ospf de cualquier direccion de origen a cualquier direccion de destino
    * __ip access-list extended `<WORD>`__: crea una lista extendida nombrada e ingresa al modo de subconfiguracion ACL
3. router(config-if)# __(implementacion de listas de acceso)__
    * __ip access-group `<1-199>` in__: asigna la lista de acceso para que analice el trafico entrante de la interfaz
    * __ip access-group `<1-199>` out__: asigna la lista de acceso para que analice el trafico saliente de la interfaz
    * __ip access-class `<WORD>` `<dir>`__ : asigna una lista de control acceso nombrada a la lineas VTY y consola

## Implementacion

Ejemplo de configuracion de una ACL extendida para denegar el trafico HTTP de una red especifica hacia un servidor, permitiendo el resto del trafico.

```sh
ip access-list extended WEB_FILTER
permit tcp 192.168.1.0 0.0.0.255 host 10.0.0.5 eq 80
permit ip any any
!
interface GigabitEthernet0/0
description LAN_OFFICE
ip address 192.168.1.1 255.255.255.0
ip access-group WEB_FILTER in
```

[volver](../readme.md)