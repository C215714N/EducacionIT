# Mascara Wildcard

La __mascara wildcard__ es un concepto utilizado en Cisco para definir qué parte de una dirección IP debe ser considerada en una comparación, particularmente en listas de control de acceso (ACL) y protocolos de enrutamiento como OSPF y EIGRP. A diferencia de una máscara de subred tradicional que indica qué bits son de red, la máscara wildcard indica qué bits deben ser ignorados (o "wildcard") en la comparación.

## Concepto Basico

En una mascara wildcard:
- Un bit **0** indica que el bit correspondiente en la dirección IP **debe coincidir exactamente**
- Un bit **1** indica que el bit correspondiente en la dirección IP **es ignorado** (puede ser 0 o 1)

Esta es la inversa lógica de una máscara de subred tradicional, donde:
- Un bit **1** en la máscara de subred indica que el bit pertenece a la porción de red
- Un bit **0** en la máscara de subred indica que el bit pertenece a la porción de host

## Conversion entre Mascara de Subred y Wildcard

Para convertir una máscara de subred a wildcard, se aplica la inversa bit a bit (NOT lógico):
- Máscara de subred: `255.255.255.0` → Wildcard: `0.0.0.255`
- Máscara de subred: `255.255.252.0` → Wildcard: `0.0.3.255`
- Máscara de subred: `255.255.255.252` → Wildcard: `0.0.0.3`

## Uso en Listas de Control de Acceso (ACL)

En las ACL, la máscara wildcard se utiliza para especificar qué rango de direcciones IP se afecta con una regla particular.

1. router(config)# __(definicion de lista estandar)__
    * __access-list `<1-99>` `<action>` `<network>` `<wildcard>`__: regla que determina la accion que debe llevarse a cabo con los paquetes que coincidan con la red especificada.
    * __access-list `<1-99>` `<action>` host `<address>`__: establece la mascara wildcard _0.0.0.0_ que coincide solamente con la direccion indicada
    * __access-list `<1-99>` `<action>` any__: establece la mascara wildard _255.255.255.255_ que coincide con todos los paquetes recibidos

2. router(config)# __(definicion de lista extendida)__
    * __access-list `<100-199>` `<action>` `<protocol>` `<src-net>` `<dest-net>` [`<operator>` `<operand>`]__: regla que permite los paquetes de la red de origen a la red de destino que correspondan con el puerto y protocolo indicados

## Uso en Protocolos de Enrutamiento

En protocolos como OSPF y EIGRP, la máscara wildcard se utiliza para definir qué interfaces participarán en el proceso de enrutamiento y qué redes serán anunciadas.

1. router(config-router)# __(configuracion protocolo OSPF)__
    * __network `<network>` `<wildcard>` area `<area>`__: declara la red que pertenece a la topologia que utiliza OSPF

2. router(config-router)# __(configuracion protocolo EIGRP)__
    * __network `<network>` `<wildcard>`__: declara la red que pertenece a la topologia que utiliza EIGRP

## Ejemplos Practicos

### Ejemplo 1: ACL Estándar
```sh
! Permite solo el host 192.168.1.100
access-list 10 permit host 192.168.1.100
! Equivalente a: access-list 10 permit 192.168.1.100 0.0.0.0

! Deniega toda la red 192.168.1.0/24
access-list 10 deny 192.168.1.0 0.0.0.255
! Permite todo el resto
access-list 10 permit any
```

### Ejemplo 2: ACL Extendida
```sh
! Permite tráfico HTTP desde cualquier host en 10.0.0.0/24 hacia un servidor específico
access-list 110 permit tcp 10.0.0.0 0.0.0.255 host 200.1.1.1 eq 80

! Deniega tráfico FTP hacia la red 172.16.0.0/16 desde cualquier origen
access-list 110 deny tcp any 172.16.0.0 0.0.255.255 eq 21
```

### Ejemplo 3: Configuración OSPF
```sh
! Incluye todas las interfaces en las redes 10.0.0.0/24 y 192.168.1.0/24 en OSPF area 0
router ospf 1
 network 10.0.0.0 0.0.0.255 area 0
 network 192.168.1.0 0.0.0.255 area 0

! Incluye una subred más grande (10.0.0.0/16)
router ospf 1
 network 10.0.0.0 0.0.255.255 area 0
```

[volver](../readme.md)