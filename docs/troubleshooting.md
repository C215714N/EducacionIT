# Resolucion de Problemas

El troubleshooting es un proceso sistematico para identificar, localizar y resolver problemas en la red.

## Metodologias

1. __Top-Down:__ Empieza en la capa de Aplicacion y baja hacia la Fisica.
2. __Bottom-Up:__ Empieza en la capa Fisica y sube hacia la de Aplicacion.
3. __Divide and Conquer:__ Empieza en una capa intermedia (Capa 3) y se mueve segun los resultados.

## Herramientas de Diagnostico

* __ping:__ Verifica la conectividad basica mediante mensajes ICMP.
* __traceroute:__ Identifica la ruta que siguen los paquetes.
* __telnet / ssh:__ Verifica la conectividad en capas superiores y acceso remoto.
* __show commands:__ Permite visualizar el estado y configuracion del dispositivo.
* __debug commands:__ Proporciona informacion en tiempo real sobre los procesos del router (usar con precaucion).

## Implementacion

La implementación de metodologías de troubleshooting debe adaptarse al tipo de problema y contexto de la red:

### Contextos de Implementación

1. **Redes de sucursal con usuarios finales**: Top-down es más intuitivo. Los problemas suelen estar en capas superiores (DHCP, DNS). Verificar con `ping` primero a gateway, luego a internet.

2. **Redes backbone/datacenter**: Bottom-up permite identificar fallas físicas (SFP, DAC, QSFP) antes de problemas lógicos. Usar `show interface | include CRC|error` para detectar errores de capa 1/2.

3. **Problemas intermitentes**: Divide and conquer con `logging` y `debug`. Configurar `logging buffered 1000000` para capturar eventos. Usar `buffered logging` para no saturar consola.

4. **Herramientas complementarias por contexto**:
   - CDP/LLDP para mapeo de capa 2: `show cdp neighbors detail`
   - Traceroute para rutas: `traceroute <dest>` con timeout ajustado
   - Telnet para capa aplicación: sin CLI, solo verifica puerto abierto

5. **Comandos de verificación estructurada**:
   - Estado interfaces: `show ip interface brief` + `show interfaces status`
   - Tabla routing: `show ip route summary` + `show ip route <prefix>`
   - Protocolos: `show ip ospf neighbor`, `show ip eigrp neighbors`, `show spanning-tree`

6. **Consideraciones de seguridad en troubleshooting**:
   - Limitar uso de debug en producción: crear ACL para `debug ip packet <acl>`
   - Usar `show tech-support` en lugar de múltiples debugs
   - Documentar hallazgos en sistema de tickets

```sh
! Verificacion inicial de interfaces
show ip interface brief
show interfaces status | include notconnect
!
! Verificacion de protocolos de routing
show ip ospf neighbor
show ip eigrp neighbors
show ip bgp summary
!
! Diagnostico de capa 3
show ip route 10.1.1.0
show arp | include 10.1.1.2
!
! Test de conectividad
ping 10.1.1.2 repeat 100 size 1500 timeout 1
traceroute 8.8.8.8 probe 3
!
! Debug controlado (usar con precaucion)
debug ip icmp
logging buffered 1000000
!
! Finalizar debug
undebug all
```

[volver](../readme.md)
