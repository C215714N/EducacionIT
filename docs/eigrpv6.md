# EIGRP para IPv6

__EIGRP para IPv6__ funciona de manera similar a EIGRP para IPv4, utilizando el algoritmo DUAL para garantizar rutas libres de bucles y una convergencia rápida. A diferencia de IPv4, EIGRPv6 se configura directamente en las interfaces y requiere que el proceso se habilite explícitamente con el comando `no shutdown`.

1. router(config)# __(configuracion global EIGRPv6)__
    * __ipv6 unicast-routing__: habilita el enrutamiento IPv6.
    * __ipv6 router eigrp `<as>`__: ingresa al submodo de configuracion de EIGRP para IPv6.
    * __eigrp router-id `<ip address>`__: establece el identificador del router (obligatorio).
    * __no shutdown__: habilita el proceso EIGRP (por defecto esta apagado).
2. router(config-if)# __(configuracion en interfaz)__
    * __ipv6 eigrp `<as>`__: habilita el proceso EIGRP en la interfaz para el sistema autonomo especificado.
3. router# __(verificacion EIGRPv6)__
    * __show ipv6 eigrp neighbors__: muestra los vecinos EIGRP para IPv6.
    * __show ipv6 eigrp topology__: muestra la tabla de topologia de EIGRPv6.
    * __show ipv6 route eigrp__: muestra las rutas IPv6 aprendidas por EIGRP.

## Implementacion

Ejemplo de configuracion de EIGRP para IPv6. Es vital recordar el comando `no shutdown` dentro del proceso del router.

```sh
ipv6 unicast-routing
!
interface GigabitEthernet0/0
 ipv6 address 2001:DB8:ACAD:1::1/64
 ipv6 eigrp 100
!
interface Serial0/0/0
 ipv6 address 2001:DB8:FEED:A::1/64
 ipv6 eigrp 100
!
ipv6 router eigrp 100
 eigrp router-id 1.1.1.1
 no shutdown
 passive-interface GigabitEthernet0/0
```

[volver](../readme.md)
