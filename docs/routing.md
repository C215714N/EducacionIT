# Enrutamiento

Es el proceso que realiza un router para _determinar la mejor ruta_ hacia un destino y _reenviar los paquetes_ de datos a traves de sus interfaces. Este proceso se basa en la informacion contenida en la __tabla de enrutamiento__.

## Tipos de Enrutamiento

1. __Enrutamiento Estatico:__ Las rutas son configuradas manualmente por un administrador. Es util en redes pequeñas o para rutas predeterminadas.
    * __Ruta Estatica Estandar:__ Apunta a una red especifica.
    * __Ruta por Defecto:__ Utilizada cuando no hay una coincidencia mas especifica (0.0.0.0/0).
    * __Ruta Estatica Flotante:__ Proporciona respaldo a otra ruta con una distancia administrativa mayor.
    * __Ruta Estatica Resumida:__ Agrupa varias redes en una sola declaracion.

2. __Enrutamiento Dinamico:__ Los routers utilizan protocolos para descubrir redes y mantener sus tablas de enrutamiento de forma automatica.
    * __IGP (Interior Gateway Protocols):__ Utilizados dentro de un Sistema Autonomo (OSPF, EIGRP, RIP).
    * __EGP (Exterior Gateway Protocols):__ Utilizados entre Sistemas Autonomos (BGP).
    * __Protocolos de Vector Distancia:__ Basan su metrica en la distancia y direccion (RIP, EIGRP).
    * __Protocolos de Estado de Enlace:__ Construyen un mapa completo de la topologia (OSPF, IS-IS).

## Distancia Administrativa (AD)

La Distancia Administrativa es la medida de confiabilidad de la fuente de la ruta. A menor AD, mayor es la prioridad de la ruta para ser instalada en la tabla de enrutamiento.

| Origen de la Ruta | Distancia Administrativa |
| :--- | :---: |
| Conectada directamente | 0 |
| Estatica | 1 |
| EIGRP (Resumen) | 5 |
| BGP Externo (eBGP) | 20 |
| EIGRP Interno | 90 |
| OSPF | 110 |
| IS-IS | 115 |
| RIP | 120 |
| EIGRP Externo | 170 |
| BGP Interno (iBGP) | 200 |

## Proceso de Enrutamiento en Cisco IOS

El siguiente mapa conceptual describe el flujo de un paquete a traves de un router Cisco:

1. __Recepcion del Trama:__ El router recibe una trama en su interfaz fisica.
2. __Desencapsulamiento Capa 2:__ Verifica si la MAC de destino coincide con la interfaz o es una direccion de broadcast/multicast. Si coincide, extrae el paquete IP.
3. __Busqueda en la Tabla de Enrutamiento:__
    * El router busca la red de destino en su tabla de enrutamiento.
    * Utiliza la coincidencia de prefijo mas largo (__Longest Prefix Match__).
4. __Determinacion del Proximo Salto:__ Una vez encontrada la mejor ruta, identifica la interfaz de salida y la direccion del proximo salto.
5. __Encapsulamiento Capa 2:__
    * Si la interfaz de salida es Ethernet, el router busca en su tabla ARP la MAC del proximo salto.
    * Encapsula el paquete IP en una nueva trama con las nuevas MAC de origen y destino.
6. __Reenvio:__ Envía la trama por la interfaz de salida seleccionada.

## Implementacion

Ejemplo de configuracion de una ruta estatica y una ruta por defecto:

```sh
! Ruta estatica a la red 192.168.2.0/24 via el proximo salto 10.0.0.2
ip route 192.168.2.0 255.255.255.0 10.0.0.2
!
! Ruta por defecto hacia el ISP
ip route 0.0.0.0 0.0.0.0 Gi0/0/0
```

[volver](../readme.md)