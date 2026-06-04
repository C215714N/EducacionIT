# Gestion de Red (Network Management)

La gestion de red incluye los protocolos y herramientas necesarios para monitorear, configurar y mantener los dispositivos de red de manera eficiente.

## Protocolos de Descubrimiento

1. __CDP (Cisco Discovery Protocol):__ Protocolo propietario de Cisco que permite descubrir dispositivos Cisco conectados directamente.
2. __LLDP (Link Layer Discovery Protocol):__ Protocolo estandar (IEEE 802.1AB) similar a CDP pero compatible con multiples fabricantes.

## Sincronizacion y Monitoreo

* __NTP (Network Time Protocol):__ Permite sincronizar la hora de los dispositivos de red para asegurar que los registros (logs) sean precisos.
* __Syslog:__ Protocolo para el envio de mensajes de notificacion y error a un servidor centralizado.
* __SNMP (Simple Network Management Protocol):__ Permite el intercambio de informacion de gestion entre dispositivos y una estacion de gestion (NMS).

## Implementacion

La implementación de servicios de gestión debe considerar los diferentes entornos operativos y requisitos de monitoreo:

### Contextos de Implementación

1. **Redes corporativas**: NTP sincroniza con servidores internos (Active Directory o dedicados). Syslog centralizado en servidor de colector (10.0.0.101). SNMP con comunidades RO/ RW restringidas por ACL.

2. **Entornos de sucursal**: LLDP habilitado para descubrir vecinos sin CDP (multi-vendor). NTP con preferencia a múltiples servidores primarios y alternos.

3. **Data Center**: Habilitar solo NTP para sincronización precisa de logs. SNMP con traps específicos para enlaces, temperatura y estado de hardware. CDP deshabilitado por seguridad.

4. **Consideraciones de seguridad**:
   - NTP con autenticación: `ntp authenticate` + `ntp authentication-key`
   - Syslog con TLS: `logging host <ip> transport tcp port 6514`
   - SNMP con ACL: `snmp-server community <string> [RO|RW] [ACL_NAME]`
   - Deshabilitar CDP en interfaces hacia Internet: `no cdp enable` en interfaces WAN

5. **Verificación de estado**:
   - NTP: `show ntp status` y `show ntp associations`
   - Syslog: `show logging` y `show logging status`
   - SNMP: `show snmp` y `show snmp group`

```sh
ntp server 10.0.0.100 prefer
ntp server 10.0.0.101
!
logging host 10.0.0.101
logging trap informational
logging facility local6
!
snmp-server community CISCO_READ RO MANAGEMENT_ACL
snmp-server community CISCO_RW_RW RW MANAGEMENT_ACL
snmp-server contact Soporte_IT
snmp-server location DataCenter_A
snmp-server enable traps
!
no cdp run
!
interface GigabitEthernet0/0
 description LAN_ACCESS
 lldp transmit
 lldp receive
```

[volver](../readme.md)
