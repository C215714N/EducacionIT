# ACLv6

1. router(config)# __(definicion de lista estandar IPv6)__
    * __ipv6 access-list `<WORD>`__: crea una lista de acceso IPv6 nombrada e ingresa al modo de subconfiguracion ACL
    * [deny|permit] `<protocol>` {`<source-ipv6-prefix>/<prefix-length>`|any|host `<source-ipv6-address>`} [operator [port-number]] {`<destination-ipv6-prefix>/<prefix-length>`|any|host `<destination-ipv6-address>`} [operator [port-number]] [dscp value] [flow-label value] [reflect `<name>`] [time-range `<name>`]

2. router(config-if)# __(implementacion de listas de acceso IPv6)__
    * __ipv6 traffic-filter `<WORD>` in__: asigna la lista de acceso IPv6 para que analice el trafico entrante de la interfaz
    * __ipv6 traffic-filter `<WORD>` out__: asigna la lista de acceso IPv6 para que analice el trafico saliente de la interfaz

3. ## Implementacion IPv6

Ejemplo de configuracion de una ACL extendida IPv6 para denegar el trafico HTTP de una red especifica hacia un servidor, permitiendo el resto del trafico.

```sh
ipv6 access-list WEB_FILTER_V6
deny tcp 2001:DB8:1::/64 any eq 80
permit ipv6 any any
!
interface GigabitEthernet0/0
description LAN_OFFICE
ipv6 address 2001:DB8:1::1/64
ipv6 traffic-filter WEB_FILTER_V6 in
```

[volver](../readme.md)