# OSPFv3

La version 3 de __Open Shortest Path First__ fue diseñada para soportar __IPv6__ y al igual que OSPFv2, utiliza el algoritmo _Dijkstra_ y es un protocolo de _estado de enlace_. Sin embargo, la configuracion se realiza mayormente a nivel de interfaz y el protocolo depende del __Router ID__ (que debe ser una direccion de 32 bits en formato IPv4).

1. router(config)# __(configuracion global OSPFv3)__
    * __ipv6 unicast-routing__: habilita el enrutamiento IPv6 (obligatorio).
    * __ipv6 router ospf `<process-id>`__: ingresa al submodo de configuracion de OSPFv3.
    * __router-id `<ip address>`__: establece el identificador del router (obligatorio en IPv6).
2. router(config-if)# __(configuracion en interfaz)__
    * __ipv6 ospf `<process-id>` area `<area>`__: habilita OSPFv3 en la interfaz especificada para un area determinada.
3. router# __(verificacion OSPFv3)__
    * __show ipv6 ospf__: muestra informacion general del proceso OSPFv3.
    * __show ipv6 ospf neighbor__: muestra los vecinos OSPFv3.
    * __show ipv6 ospf interface__: muestra las interfaces donde corre OSPFv3.
    * __show ipv6 route ospf__: muestra las rutas IPv6 aprendidas via OSPFv3.

## Implementacion

La implementación de OSPFv3 debe considerar la naturaleza de las redes IPv6 y los contextos de despliegue:

### Contextos de Implementación

1. **Redes IPv6 puras (sin IPv4)**: OSPFv3 es el protocolo principal de enrutamiento. Requiere Router ID explícito (aunque no hay IPv4). Se recomienda usar dirección IPv4 ficticia tipo `1.1.1.1` para el router-id.

2. **Topologías dual-stack (IPv4 + IPv6)**: OSPFv3 opera independientemente de OSPFv2. Se configuran áreas separadas o comparten infraestructura física pero con bases de datos de enrutamiento distintas.

3. **Consideraciones de compatibilidad**:
   - Router ID: debe ser IPv4 única en la topología, aunque el routing sea IPv6
   - Multi-topologías: OSPFv3 soporta múltiples tablas de enrutamiento (IPv4 e IPv6)
   - Interfaces pasivas: usar `passive-interface` igual que OSPFv2 para evitar adyacencias innecesarias

4. **Area 0 backbone**: La arquitectura jerárquica con área 0 es obligatoria. Los routers ABR interconectan áreas IPv6.

5. **Ajustes de costos**: Similar a OSPFv2, se ajusta el ancho de banda de referencia para enlaces de alta velocidad (10G/100G).

6. **Verificación**: Usar comandos `show ipv6 ospf neighbor` y `show ipv6 route ospf` para validar la adyacencia y rutas aprendidas.

```sh
ipv6 unicast-routing
!
interface GigabitEthernet0/0
 ipv6 address 2001:DB8:ACAD:1::1/64
 ipv6 ospf 10 area 0
!
interface Serial0/0/0
 ipv6 address 2001:DB8:FEED:A::1/64
 ipv6 ospf 10 area 0
!
ipv6 router ospf 10
 router-id 1.1.1.1
 passive-interface GigabitEthernet0/0
```

[volver](../readme.md)
