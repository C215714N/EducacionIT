# OSPFv3

La version 3 de __Open Shortest Path First__ fue diseñada para soportar __IPv6__ y al igual que OSPFv2, utiliza el algoritmo _Dijkstra_ y es un protocolo de _estado de enlace_. Sin embargo, la configuracion se realiza mayormente a nivel de interfaz y el protocolo depende del __Router ID__ (que debe ser una direccion de 32 bits en formato IPv4).

1. router(config)# __(configuracion global OSPFv3)__
    * __ipv6 unicast-routing__: habilita el enrutamiento IPv6 (obligatorio).
    * __ipv6 router ospf `<process-id>`__: ingresa al submodo de configuracion de OSPFv3.
    * __router-id `<ip address>`__: establece el identificador del router (obligatorio en IPv6).
2. router(config-if)# __(configuracion en interfaz)__
    * __ipv6 ospf `<process-id>` area `<area>`__: habilita OSPFv3 en la interfaz especificada para un area determinada.
3. router# __(verificacion OSPFv3)__
    * __show ipv6 ospf__: muestra informacion general del proceso OSPFv3.
    * __show ipv6 ospf neighbor__: muestra los vecinos OSPFv3.
    * __show ipv6 ospf interface__: muestra las interfaces donde corre OSPFv3.
    * __show ipv6 route ospf__: muestra las rutas IPv6 aprendidas via OSPFv3.

## Implementacion

En OSPFv3, a diferencia de OSPFv2, no se utiliza el comando `network` en el submodo del router, sino que se activa directamente en cada interfaz.

```sh
ipv6 unicast-routing
!
interface GigabitEthernet0/0
ipv6 address 2001:DB8:ACAD:1::1/64
ipv6 ospf 10 area 0
!
interface Serial0/0/0
ipv6 address 2001:DB8:FEED:A::1/64
ipv6 ospf 10 area 0
!
ipv6 router ospf 10
router-id 1.1.1.1
passive-interface GigabitEthernet0/0
```

[volver](../readme.md)
