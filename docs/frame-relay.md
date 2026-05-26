# Frame Relay

__Frame Relay__ es una tecnología WAN de conmutación de circuitos que proporciona transmisión de paquetes de datos entre sitios remotos. Utiliza técnicas de conmutación de datagramas (VC: Virtual Circuits) para establecer conexiones lógicas sobre una infraestructura compartida. Es una tecnología legacy pero importante para entender evoluciones actuales como MPLS.

1. router(config-if)# __(configuracion interfaz Frame Relay)__
    * __encapsulation frame-relay__: habilita el encapsulamiento Frame Relay en la interfaz serial
    * __frame-relay lmi-type [cisco|ansi|q933a]__: configura el tipo de LMI (Local Management Interface) para la encapsulacion
    * __frame-relay map ip `<ip>` `<dlci>` [broadcast]__: establece mapeo entre IP y DLCI para circuitos punto-a-multipunto

2. router(config-if)# __(configuracion LMI)__
    * __frame-relay lmi-type ansi__: establece el tipo de LMI estándar ANSI para interoperabilidad multi-vendor
    * __keepalive `<seconds>`__: define el intervalo de keepalive para la supervisión del enlace
    * __frame-relay TEI [6|10 digits]__: configura el formato del TEI (Terminal Endpoint Identifier)

3. router(config-if)# __(circuitos Frame Relay)__
    * __frame-relay map ip `<ip>` `<dlci>` broadcast: mapeo para circuitos que requieren anuncios de routing (multicast/broadcast)
    * __show frame-relay pvc__: verifica el estado de los circuitos virtuales (PVCs)
    * __show frame-relay map__: muestra los mapeos DLCI-IP configurados
    * __show interfaces serial `<interface>`__: muestra estadisticas de la interfaz Frame Relay

## Implementacion

La implementación de Frame Relay debe considerarse según el arquitectura de red y requisitos de conectividad:

### Contextos de Implementación

1. **Hub-and-spoke (centralizado)**: Un hub central conecta múltiples spokes. Consideraciones:
   - Spokes usan DLCI local para spoke-spoke, DLCI hub para spoke-hub
   - Configurar `frame-relay map ip <hub-ip> <hub-dlci> broadcast` en spokes
   - Protocolos de routing: usar `neighbor <ip> <interface>` en OSPF para spokes
   - Split horizon: manejar con `no ip split-horizon` en EIGRP o `subinterfaces`

2. **Malla parcial (partial mesh)**: Algunos enlaces hub-spoke tienen conectividad directa. Optimiza:
   - Multiplicar tráfico entre spokes mediante circuitos dedicados
   - Usar OSPF con `point-to-multipoint` o EIGRP con `no split-horizon`
   - Establecer prioridades de routing según costos de PVC

3. **Full mesh (completo)**: Cada sitio conecta directamente a todos los demás. Menos común por costos:
   - Cada router necesita DLCI hacia cada peer
   - Routing más simple (no requiere split horizon workarounds)
   - Costoso en PVCs: N*(N-1)/2 circuitos para N routers

4. **Consideraciones de LMI y encapsulación**:
   - Interoperabilidad: usar `frame-relay lmi-type ansi` para multi-vendor
   - LMI autodetect: `autodetect` en interfaces modernas
   - Keepalive: default 10s, ajustar según SLA de proveedor

5. **Configuración de subinterfaces**:
   - Point-to-point: `interface Serial0/0/0.100 point-to-point`
   - Point-to-multipoint: `interface Serial0/0/0.100 multipoint`
   - Permite sobrecomer split horizon sin disable global

6. **Verificación y troubleshooting**:
   - `show frame-relay pvc` para estado ACTIVE/INACTIVE
   - `show frame-relay lmi` para ver LMI statistics
   - `show interfaces` para errores de CRC y drops
   - `debug frame-relay lvi` para LMI exchanges (usar con precaución)

```sh
! Configuracion interfaz DCE (hub)
interface Serial0/0/0
 description FRAME_RELAY_HUB
 encapsulation frame-relay
 frame-relay lmi-type cisco
 frame-relay map ip 10.0.1.2 102 broadcast
 frame-relay map ip 10.0.1.3 103 broadcast
 ip address 10.0.1.1 255.255.255.0
!
! Configuracion spoke 1 (subinterface point-to-point)
interface Serial0/0/0.102 point-to-point
 description TO_HUB
 ip address 10.0.1.2 255.255.255.0
 frame-relay interface-dlci 201
!
! Routing con OSPF (hub-and-spoke)
router ospf 1
 network 10.0.1.0 0.0.0.255 area 0
 neighbor 10.0.1.2 Serial0/0/0
```

[volver](../readme.md)