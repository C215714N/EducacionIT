# OSPF

__Open Shortest Path First__ es un protocolo de red es estandar abierto para enrutamiento jerarquico tipo _Internal Gateway Protocol (IGP)_, que usa el algoritmo _Dijkstra_, para calcular la ruta mas corta entre dos nodos y selecciona la de menor costo para incorporarla a la tabla de enrutamiento. Por defecto el ancho de banda referencial es de `100.000Kbps` y si la interfaz es `FastEthernet`, el resultado es `metrica = 1`. Para determinar el costo de las rutas aprendidas este protocolo realiza el siguiente calculo $\dfrac{Ref BW}{Link Speed}$ 

1. router(config-router)# __(configuracion protocolo OSPF)__
    * __router ospf `<process-id>`__: ingresa al submodo de configuracion de OSPF
    * __router-id `<ip address>`__: establece un numero identificador para el router en formato IP 
    * __network `<network>` `<wildcard>` area `<area>`__: declara la red que pertenece a la topologia que utiliza OSPF
2. router# __(verificacion configuracion OSPF)__
    * __show ip ospf__: muestra la cesonfiguracion de los procesos OSPF
    * __show ip ospf neighbor__: muestra los dispositivos conectados directamente que usan OSPF
    * __show ip ospf database__: muestra informacion relacionada con el mapa de la topologia 
    * __show ip route ospf__: muestra las rutas aprendidas a traves del protocolo OSPF
3. router(config-router)#: __(actualizacion de ajustes)__
    * __passive interface `<interface-id>`__: evita el envio de paquetes OSPF en las interfaces especificadas
    * __auto-cost reference-bandwidth `<Mbits>`__: establece el ancho de banda de referencia para el calculo del algoritmo _Dijkstra_
    * __default-information originate__: comparte las rutas predeterminadas mediante multicast

## Implementacion

Cuando configuramos el __proceso OSPF__ en el dispositivo, para agiliza la comparticion, primero debemos _configurar las redes_. Tambien es necesario definir el __Router ID__ para ubicar el dispositivo con mayor facilidad en la topologia, en caso que este no este definido se utilizara la direccion mas alta de la _interfaz Loopback_ o la _direccion IP mas alta_ de las interfaces fisicas.

```sh
interface Gi0/0
ip address 10.0.0.1 255.255.255.0
description LAN NETWORK
!
interface Gi0/0/0
ip address 10.0.1.2 255.255.255.252
description WAN NETWORK
!
router ospf 10
router-id 1.1.1.1
passive-interface Gi0/0
auto-cost reference-bandwith 100000
network 10.0.0.0 0.0.0.255 area 0
network 10.0.1.0 0.0.0.3 area 0
```

[volver](../readme.md)