# Inspección ARP Dinamica

__Dynamic ARP Inspection (DAI)__ es una característica de seguridad que valida los paquetes ARP en una red. DAI intercepta, registra y descarta paquetes ARP con enlaces de dirección IP a MAC no válidos para proteger la red contra ataques de envenenamiento de caché ARP (ARP spoofing).

1. switch(config)# __(Configuración Global)__
    * __ip arp inspection vlan `<vlan-id>`__: Habilita DAI para una o más VLANs.
    * __ip arp inspection validate `<arp-field>`__: Configura qué campos deben ser validados.
2. switch(config-if)# __(Configuración de Interfaz)__
    * __ip arp inspection trust__: Configura una interfaz como confiable.

## Implementacion

DAI depende de la base de datos creada por DHCP Snooping para verificar la correspondencia entre la dirección IP y la MAC de origen en los paquetes ARP. Por lo tanto, DHCP Snooping debe estar habilitado. Las interfaces se clasifican en confiables y no confiables. Los paquetes ARP en interfaces no confiables son interceptados y validados, mientras que en las interfaces confiables pasan sin inspección.

```sh
ip arp inspection vlan 10
ip arp inspection validate src-mac dst-mac ip
!
interface GigabitEthernet0/1
description DISTRIBUTION LAYER
ip arp inspection trust
```

`volver`(../readme.md)
