# Enrutamiento Estático

Metodo utilizado para configurar manualmente las direcciones de red en la tabla de enrutamiento, indicando por cual interfaz de red los paquetes ser redireccionados. Es útil para redes pequeñas, redes stub, o para establecer una puerta de enlace de último recurso, aunque no es muy escalable ni flexible para redes grandes o cambiantes.

1. router(config)# __(Configuración de Rutas IPv4)__
    * __ip route `<network>` `<subnet-mask>` `<next-hop>`__: Establece una ruta estática especificando la IP del siguiente salto.
    * __ip route `<network>` `<subnet-mask>` `<interface>`__: Define una ruta estática directa indicando la interfaz de salida.
    * __ip route 0.0.0.0 0.0.0.0 `<next-hop>`__: Crea una ruta predeterminada o de último recurso.
    * __ip route `<network>` `<subnet-mask>` `<next-hop>` `<metric>`__: Crea una ruta estática flotante con una métrica administrativa mayor.
2. router(config)# __(Configuración de Rutas IPv6)__
    * __ipv6 unicast-routing__: Habilita el enrutamiento de paquetes IPv6 globalmente.
    * __ipv6 route `<ipv6-prefix>`/`<prefix-length>` `<next-hop | interface>`__: Establece una ruta estática para IPv6.

## Implementacion

El enrutamiento estático es fundamental para dirigir el tráfico entre redes que no están directamente conectadas. La elección entre una ruta completamente especificada (con IP de siguiente salto) o una conectada directamente (con interfaz de salida) depende de la topología. 

En redes punto a punto, usar la interfaz de salida es eficiente. En redes de acceso múltiple como Ethernet, es preferible usar la IP del siguiente salto para evitar consultas ARP innecesarias. Para IPv6, es necesario primero habilitar el enrutamiento de paquetes IPv6 de forma global en el router con el comando `ipv6 unicast-routing`.

```sh
ipv6 unicast-routing
!
interface Gigabit0/0/0
ip address 192.168.1.1 255.255.255.0
ipv6 address 2001:db8:feed:1::1/112
ipv6 address fe80::1 link-local
description LAN NETWORK
!
interface GigabitEthernet 0/2/0
ip address 191.186.24.2 255.255.255.252
ipv6 address 2001:db8:feed::2/126
ipv6 address fe80::1 link-local
description WAN NETWORK
!
interface Serial0/1/1
ip address 172.16.0.1 255.255.255.252
ipv6 address 2001:db8:feed::5/126
ipv6 address fe80::1 link-local
description PPP NETWORK
!
ip route 172.16.1.0 255.255.255.0 192.168.1.2
ip route 172.16.2.0 255.255.255.0 Serial0/1/0
ip route 0.0.0.0 0.0.0.0 191.186.24.1
!
ipv6 route 2001:db6:acad::/48 2001:db8:feed:1::2
ipv6 route 2001:db8:feed::/48 2001:db8:feed::6
ipv6 route ::/0 2001:db8:feed::1
```

[volver](../readme.md)