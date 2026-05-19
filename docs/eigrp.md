# EIGRP

__Enhanced Interior Gateway Routing Protocol__ es un protocolo de enrutamiento de tipo _vector distancia_ propietario de __CISCO__, que mejora las propiedades de convergencia y opera con mayor eficiencia que IGRP. Se considera un protocolo avanzado que se basa en las características normalmente asociadas con los protocolos del estado de enlace. Al igual que en su version anterior el calculo de la metrica es el siguiente 

$256 * (K1 * bw + \dfrac{K2 * bw}{256 - load} + K3 * dy) * \dfrac{K5}{rel + K4}$ 

Pero teniendo en cuenta que, de manera predeterminada, los unicos valores habilitados son _k1 y k3_, el calculo del protocolo se representaria de la siguiente forma $256 * (BandWidth + Delay)$

1. router(config-router)# __(configuracion protocolo EIGRP)__
    * __router eigrp `<autonomous system>`__: ingresa al submodo de configuracion de EIGRP
    * __eigrp router-id `<ip address>`__: establece un numero identificador para el router en formato IP 
    * __network `<network>` `<wildcard>`__: declara la red que pertenece a la topologia que utiliza EIGRP
2. router# __(verificacion configuracion EIGRP)__
    * __show ip eigrp traffic__: muestra las estadisticas de los mensajes de EIGRP organizados por sistema autonomo.
    * __show ip eigrp neighbors__: muestra los dispositivos de la topologia que utilizan EIGRP
    * __show ip eigrp topology__: muestra la tabla de la topologia generada con EIGRP
    * __show ip route eigrp__: muestra las rutas aprendidas a traves del protocolo EIGRP.
3. router(config-router)#: __(actualizacion de ajustes)__
    * __passive interface `<interface-id>`__: evita el envio de paquetes EIGRP en las interfaces especificadas
    * __auto-summary__: habilita la sumarizacion de subredes para simplificar rutas.

## Implementacion

Ejemplo de configuracion basica de EIGRP utilizando un Sistema Autonomo (AS) y desactivando la sumarizacion automatica.

```sh
interface Gi0/0
ip address 10.0.0.1 255.255.255.0
description LAN NETWORK
!
interface Gi0/0/0
ip address 10.0.1.2 255.255.255.252
description WAN NETWORK
!
router eigrp 100
eigrp router-id 1.1.1.1
network 10.0.0.0 0.0.0.255
network 10.0.1.0 0.0.0.3
passive-interface GigabitEthernet0/0
no auto-summary
```

[volver](../readme.md)