# IPSec

__internet protocol security__ es un conjunto de protocolos cuya función es asegurar las comunicaciones sobre el Protocolo de Internet autenticando y/o cifrando cada paquete IP en un flujo de datos. También incluye protocolos para el establecimiento de claves de cifrado como __internet security authentication key message protocol__, protocolo criptográfico que constituye la base para el intercambio de claves IKE utilizado en el marco de IPsec para autenticar entidades, así como para establecer y gestionar asociaciones de seguridad.

1. router(config-isakmp)# __fase 1: intercambio de credenciales__
    * __crypto isakmp policy `10`__: Ingresa al submodo de configuracion de prioridad para la suite de proteccion ISAKMP
    * __encryption `3des`__: Define el tipo de encriptacion a utilizar
    * __hash `md5`__: Selecciona el metodo utilizado para validar la informacion
    * __authentication `pre-share`__: Establece el tipo de autenticacion por clave previamente compartida
    * __group `2`__: Grupo del algoritmo Diffie-Hellman para el establecimiento de una clave secreta
1. router(config-crypto-map)# __fase 2: asociacion de seguridad__
    * __crypto map `<WORD>` 10 ipsec-isakmp__ Ingresa al submodo de configuracion de mapa criptografico ISAKMP
    * __set peer `<public ip>`__: Establece la direccion publica del host remoto con el que establecera el tunel
    * __set transform-set `<WORD>`__: Valida el grupo de autenticacion establecido en el transform-set
    * __match address `<access-list>`__: Selecciona la lista de control de acceso para las coincidencias
1. router(config)#
    * __crypto isakmp key `<password>` address `<peer>`__: Define la contraseña y la IP Publica del Host Remoto
    * __crypto ipsec transform-set `<WORD>` `esp-3des` `esp-md5-hmac`__ Establece el codigo de autenticacion basado en hash
1. router(config-if)# __implementacion IPsec VPN__
    * __ip access-list extended `<access-list>`__: accedemos al submodo de configuracion de acl
    * __permit ip `192.168.1.0 0.0.0.255` `192.168.0.0 0.0.0.255`__ define una regla que permite el trafico de origen y destino entre las redes privadas
    * __interface `<interface id>`__: Ingresa al submodo de configuracion de interfaz
    * __crypto map `<WORD>`__: Selecciona el mapa criptografico a aplicar

## Implementacion

La implementación de IPSec debe considerarse para diferentes escenarios de conectividad segura:

### Contextos de Implementación

1. **VPN Site-to-Site (HQ a sucursales)**: Tunnel entre gateways permamentemente conectados. Consideraciones:
   - ISAKMP Phase 1: lifetime máximo 86400s para reducir renegociación
   - Transform set: usar AES-256/SHA-256 para alta seguridad
   - ACL de tráfico: permitir solo redes locales (no any)

2. **VPN Remote Access (teletrabajo)**: Clientes dinámicos con direcciones no predecibles. Se usa transform set con `mode transport` y pool de direcciones virtuales.

3. **Interoperabilidad multi-vendor**: Usar transform sets estándar `esp-aes esp-sha-hmac`. Evitar comandos CISCO específicos como `crypto isakmp keepalive`.

4. **High Availability (HA VPN)**: Backup de VPN con múltiples crypto maps o VTI (Virtual Tunnel Interfaces). Usar tracking objects para failover automático.

5. **Consideraciones de rendimiento**:
   - Hardware crypto: `show crypto engine` para ver uso de ASIC
   - MTU: reducir a 1400 bytes para evitar fragmentación (`ip mtu 1400`)
   - Anti-replay: habilitar para protección contra ataques de replay

6. **Troubleshooting**:
   - Fase 1: `show crypto isakmp sa`
   - Fase 2: `show crypto ipsec sa`
   - NAT traversal: `crypto isakmp nat-traversal 20`

```sh
! Fase 1: ISAKMP (IKEv1)
crypto isakmp policy 10
 encr aes 256
 hash sha256
 authentication pre-share
 group 14
crypto isakmp key CLAVE_SECRETA address 200.1.1.2
crypto isakmp keepalive 10 periodic
!
! Fase 2: IPsec Transform Set
access-list 110 permit ip 192.168.1.0 0.0.0.255 192.168.2.0 0.0.0.255
crypto ipsec transform-set SET_VPN esp-aes 256 esp-sha256-hmac
mode tunnel
!
! Crypto Map
crypto map MAPA_VPN 10 ipsec-isakmp
 set peer 200.1.1.2
 set transform-set SET_VPN
 set pfs group14
 match address 110
!
! Aplicacion a interfaz WAN
interface GigabitEthernet0/1
 description WAN_CONNECTION
 ip address 200.1.1.1 255.255.255.252
 crypto map MAPA_VPN
```

[volver](../readme.md)