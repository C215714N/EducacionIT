# ACL

__Access Control List__ corresponde a una serie de reglas que determinan si un router reenvia o descarta un paquete segun la informacion que se encuentra en la cabecera, permitiendo controlar el flujo de trafico. El principal objetivo de las ACL es filtrar el trafico de red, pemitiendo o denegando el mismo en base a una condicion, de manera similar al funcionamiento de un _firewall_. Las mismas se aplican al trafico entran y saliente, no operando sobre los paquetes originados en el router.

1. router(config)# __(definicion de lista estandar)__
    * __access-list `<1-99>` `<action>` `<network>` `<wildcard>`__: determina la accion que debe llevarse a cabo con los paquetes que coincidan.
    * __access-list `<1-99>` `<action>` host `<address>`__: establece la mascara wildcard _0.0.0.0_ que coincide solamente con la direccion indicada
    * __access-list `<1-99>` `<action>` any__: utliliza la mascara wildard _255.255.255.255_ que coincide con todos los paquetes recibidos
    * __ip access-list standard `<WORD>`__: crea una lista estandar nombrada e ingresa al modo de subconfiguracion ACL
2. router(config)# __(definicion de lista extendida)__
    * __access-list `<100-199>` `<action>` `<protocol>` `<src-net>` `<dest-net>` [`<operator>` `<operand>`]__: determina la accion a realizar con los paquetes que coincidan con la red de origen y destino que correspondan con el puerto y protocolo indicados
    * __access-list `100` permit `ospf` any any__: regla que permite los paquetes ospf de cualquier direccion de origen a cualquier direccion de destino
    * __ip access-list extended `<WORD>`__: crea una lista extendida nombrada e ingresa al modo de subconfiguracion ACL
3. router(config-if)# __(implementacion de listas de acceso)__
    * __ip access-class `<WORD>` `<dir>`__ : asigna una lista de control acceso nombrada a la lineas VTY y consola
    * __ip access-group `<1-199>` in__: asigna la lista de acceso para que analice el trafico entrante de la interfaz
    * __ip access-group `<1-199>` out__: asigna la lista de acceso para que analice el trafico saliente de la interfaz

## Implementacion

Para un uso apropiado de las ACL se debe considerar el flujo de tráfico y el punto óptimo de aplicación, siendo algunas consideraciones clave:

* __Perímetro de red__: Bloquear acceso directo a recursos internos. Se aplican en la interfaz WAN para filtrar tráfico no deseado antes de entrar al router.
* __Control inter-VLAN__: Para limitar acceso lateral, se colocan cerca del origen del tráfico para evitar saturar la red con paquetes que serán denegados.
* __Política de denegacion__: Las ACL terminan con `deny any` implícito. Para permitir tráfico específico, se debe agregar `permit any` al final.
* __ACL extendidas para servidores__: Filtrado granular por protocolo (TCP/UDP), puertos y direcciones. 
   - Colocar reglas más específicas primero (orden de evaluación top-down)
   - Usar `eq`, `gt`, `lt` para puertos específicos
   - Documentar cada regla con comentarios claros
5. __ACL nombradas__: Son más flexibles y permiten secuencias numeradas, usan `permit/deny` como para editar reglas individuales sin rehacer la lista.
6. __Consideraciones de rendimiento__: ACL procesan paquetes en orden. Reglas demasiado específicas o desordenadas pueden impactar la latencia.

```sh
ip access-list extended WEB-FILTER
permit tcp 192.168.1.0 0.0.0.255 host 10.0.0.5 eq 443
permit udp 192.168.1.0 0.0.0.255 any eq 53
permit ospf any any
!
interface GigabitEthernet0/0
description LAN_OFFICE
ip address 192.168.1.1 255.255.255.0
ip access-group WEB-FILTER in
```

[volver](../readme.md)