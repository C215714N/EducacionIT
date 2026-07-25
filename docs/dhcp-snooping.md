# DHCP Snooping

DHCP Snooping es una característica de seguridad de capa 2 que actúa como un cortafuegos entre los dispositivos no confiables (clientes) y los servidores DHCP confiables. Filtra los mensajes DHCP de fuentes no autorizadas y construye una base de datos de enlaces (dirección MAC, dirección IP, VLAN, interfaz) que es utilizada por otras características de seguridad como Dynamic ARP Inspection (DAI).

1. switch(config)# __(Configuración Global)__
    * __ip dhcp snooping__: Habilita DHCP Snooping globalmente.
    * __ip dhcp snooping vlan `<vlan-id>`__: Habilita DHCP Snooping para VLANs específicas.
    * __ip dhcp snooping information option__: Permite al switch insertar y remover la opción 82 en los mensajes DHCP.
2. switch(config-if)# __(Configuración de Interfaz)__
    * __ip dhcp snooping trust__: Configura la interfaz como confiable. Solo los puertos confiables pueden enviar ofertas DHCP.
    * __ip dhcp snooping limit rate `<pps>`__: Limita el número de paquetes DHCP por segundo que una interfaz puede recibir.

## Implementacion

Primero se habilita DHCP Snooping de forma global y para las VLANs relevantes. Luego, se configuran los puertos que se conectan a servidores DHCP legítimos como "confiables" (`trust`). Todos los demás puertos, especialmente los de acceso de usuario, se dejan como no confiables por defecto. Cualquier mensaje de oferta DHCP (DHCPOFFER) que llegue a un puerto no confiable será descartado.

```sh
ip dhcp snooping
ip dhcp snooping vlan 10
!
interface range FastEthernet0/1-24
description CLIENT INTERFACE
ip dhcp snooping limit rate 5
!
interface GigabitEthernet0/1
description SERVER INTERFACE
ip dhcp snooping trust
```

[volver](../readme.md)