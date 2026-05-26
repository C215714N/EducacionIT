# ACLv6

1. router(config)# __(definicion de lista estandar IPv6)__
    * __ipv6 access-list `<WORD>`__: crea una lista de acceso IPv6 nombrada e ingresa al modo de subconfiguracion ACL
    * [deny|permit] `<protocol>` {`<source-ipv6-prefix>/<prefix-length>`|any|host `<source-ipv6-address>`} [operator [port-number]] {`<destination-ipv6-prefix>/<prefix-length>`|any|host `<destination-ipv6-address>`} [operator [port-number]] [dscp value] [flow-label value] [reflect `<name>`] [time-range `<name>`]

2. router(config-if)# __(implementacion de listas de acceso IPv6)__
    * __ipv6 traffic-filter `<WORD>` in__: asigna la lista de acceso IPv6 para que analice el trafico entrante de la interfaz
    * __ipv6 traffic-filter `<WORD>` out__: asigna la lista de acceso IPv6 para que analice el trafico saliente de la interfaz

3. ## Implementacion IPv6

La implementación de ACL IPv6 difiere de IPv4 y requiere considerar aspectos específicos del entorno dual-stack o puramente IPv6:

* __Redes dual-stack__: ACL IPv6 complementa ACL IPv4 en segmentos donde ambos protocolos coexisten. La política de filtrado puede ser idéntica o diferente según requerimientos de seguridad.
* __Migración a IPv6__: Durante transición, se aplican ACL IPv6 más restrictivas inicialmente, ya que el tráfico IPv6 aún no está ampliamente estudiado por equipos de seguridad.
* __Consideraciones de sintaxis__:
   - Solo ACL nombradas (`ipv6 access-list <name>`)
   - No existe número implícito para `any` (se usa `permit ipv6 any any`)
   - No requieren notación wildcard, usan prefijo `/bit-length`
* __Flujo de tráfico entrante vs saliente__: Similar a IPv4, pero con mayor impacto en equipos que procesan extensiones de encabezado IPv6 (Hop-by-Hop, Routing Header).
* __Time-based y reflexivo__: IPv6 soporta `time-range` y `reflect` para ACLs dinámicas, útiles para políticas de acceso temporal.

```sh
ipv6 access-list WEB_FILTER_V6
permit tcp 2001:DB8:1::/64 any eq 443
permit udp 2001:DB8:1::/64 any eq 135
permit ipv6 any any
!
interface GigabitEthernet0/0
description LAN_OFFICE
ipv6 address 2001:DB8:1::1/64
ipv6 traffic-filter WEB_FILTER_V6 in
```

[volver](../readme.md)