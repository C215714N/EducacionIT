# NAT

__Network Address Translation__ es un mecanismo utilizado por los routers para cambiar paquetes entre dos redes que asignan mutuamente direcciones incompatibles y se implementa generalmente para la comunicacion de redes privadas con redes publicas. Surge como una solucion al problema de agotamiento de direcciones en IPv4 y puede implementarse de diferentes maneras como _estatica_, cuando la traduccion se realiza individualmente, _dinamica_, cuando se asigna una lista de direcciones a traducir, y con _sobrecarga_ donde ademas se asocia un numero de puerto para seguir la comunicacion.

1. router(config)# __(definicion de direcciones)__
    * __ip nat inside source static `<local ip>` `<global ip>`__: define la direccion que debe asignarse a la ip privada
    * __ip nat pool `<WORD>` `<start ip>` `<end ip>` netmask `<netmask>`__: define la lista de direcciones publicas
2. router(config)# __(asociacion dinamica)__
    * __ip nat inside source list `<WORD>` pool `<WORD>`__: define que ACL utilizar con la lista de direcciones NAT
    * __ip nat inside source list `<WORD>` interface `<interface-id>` overload__: habilita PAT indicando la interfaz de salida 
    * __ip nat inside source list `<WORD>` pool `<WORD>` overload__: implementa NAT Dinamico con sobrecarga
3. router(config-if)# __(asignacion de direcciones)__
    * __ip nat inside__: define la interfaz de trafico entrante que debera coincidir con la lista de direcciones LAN privadas
    * __ip nat outside__: define la interfaz de trafico saliente donde debera reemplazar las direcciones de origen con las WAN Publicas
4. router# __(verificacion de configuracion y traducciones)__
    * __show ip nat translations__: muestra la lista de paquetes, protocolos y puertos utilizados en las comunicaciones NAT
    * __show ip nat statistics__: muestra un resumen de las estadisticas y configuracion NAT del dispositivo

## Implementacion

La implementación de NAT debe considerarse según el escenario de conectividad y disponibilidad de direcciones:

### Contextos de Implementación

1. **NAT dinámico con sobrecarga (PAT)**: Compartir una única dirección pública. Ideal para redes con múltiples hosts y un solo bloque de direcciones públicas. Consideraciones:
   - ACL debe permitir tráfico de salida (source NAT)
   - Solo un `ip nat outside` por router
   - Limite de sesiones simultáneas (registro NAT explosion)

2. **NAT estático (1:1)**: Servidor interno accesible desde internet. Se configuran reglas 1:1 entre IP pública y privada. Requiere ACL para restringir acceso.

3. **NAT dinámico sin sobrecarga**: Asignar direcciones públicas individuales de un pool. Útil para acceso a internet con trazabilidad directa por IP.

4. **NAT con ACL avanzada**: Filtrar tráfico antes del NAT. Protocolos como FTP requieren `ip nat service enable` y `static ftp`. VoIP necesita `ip nat service sip udp port 5060`.

5. **Consideraciones de alta disponibilidad**:
   - HSRP + NAT: usar `standby 1 ip` con `standby 1 preempt`
   - NAT redundancy: configurar mismo pool en routers primario/backup
   - Verificar `show ip nat translations` para sesiones activas

6. **IPv6 NAT (NAT64)**: Traducir direcciones IPv6 a IPv4. Se usa `ipv6 nat` y prefix de traducción. No recomendado para producción (requiere DNS64).

```sh
! Pool de direcciones públicas y ACL de permitidos
ip nat pool PUBLIC_POOL 200.1.1.10 200.1.1.20 netmask 255.255.255.248
!
ip access-list extended NAT-ACL
 permit 192.168.10.0 0.0.0.255
!
! NAT dinámico con sobrecarga
ip nat inside source list NAT-ACL interface GigabitEthernet0/1 overload
!
! NAT estático para servidor
ip nat inside source static tcp 192.168.10.100 443 200.1.1.100 443 extendable
!
interface GigabitEthernet0/0
 description PRIVATE_LAN
 ip address 192.168.10.1 255.255.255.0
 ip nat inside
!
interface GigabitEthernet0/1
 description PUBLIC_WAN
 ip address dhcp
 ip nat outside
```

[volver](../readme.md)