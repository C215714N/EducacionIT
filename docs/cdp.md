# Identificacion de Dispositivos

Cuando trabajamos en una red previamente configurada y no disponemos de documentacion o simplemente necesitamos corroborar que dispositivos estan conectados en las diferentes interfaces de red, disponemos de __protocolos de CAPA 2__ que permiten a los dispositivos de internetworks intercambiar informacion utilizando tramas que se envian periodicamente, _compartiendo la informacion del enlace_.

1. switch(config)# __(Protocolos nivel de capa 2)__
	* __cdp run__: Habilita Cisco Discovery Protocol
	* __lldp run__: Habilita Link Layer Discovery Protocol
2. switch(config-if)# __(Configuracion LLDP)__
	* __lldp transmit__: Habilita el envio de tramas LLDP (compartir datos)
	* __lldp receive__: Habilita la recepcion de tramas LLDP (procesar datos)
3. switch(config-if)# __(verificacion de vecinos)__
	* __show cdp neighbors__: Muestra los dispositivos identificados mediante CDP
	* __show lldp neighbors__: Muestra los dispositivos identificados mediante LLDP
    * __show cdp interface__: Muestra las interfaces que utilizan el protocolo CDP

## Implementacion

El __protocolo cdp__ se encuentra _activado por defecto_ en los dispositivos __CISCO__, pero aun asi es necesario bloquear los mensajes multicast en aquellas interfaces que se conecten a dispositivos finales o segmentos de red, con los que no debemos compartir informacion de la topologia. Tambien podemos __habilitar el protocolo lldp__ para identificar aquellos dispositivos de red que _pertenecen a otras marcas_, garantizando el reconocimiento de los mismos.

```sh
enable
configure terminal
cdp run
lldp run
!
interface range FastEthernet 0/1-24
no cdp enable
no lldp transmit
no lldp receive
description ACCESS LAYER
|
interface range GigabitEthernet 0/1-2
cdp enable
lldp transmit
lldp receive
description DISTRIBUTION LAYER
```

[volver](../readme.md)