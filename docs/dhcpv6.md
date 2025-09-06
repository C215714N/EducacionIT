# Direccionamiento IPv6 con Servicio de DHCP

Es un protocolo cliente-servidor que proporciona una configuración administrada de dispositivos sobre IPv6. DHCPv6 funciona sobre el protocolo de transporte UDP. El cliente utiliza una dirección link-local u otra determinada a través de otros mecanismos para transmitir y recibir los mensajes DHCPv6.

1. router(config-if)# __(Configuracion de Interfaz)__
	* __ipv6 unicast-routing__ Habilita el enrutamiento de paquetes IPv6 y mensajes Router Advertisement (SLAAC)
	* __ipv6 enable__ Habilita el protocolo IPv6 en la interfaz seleccionada
	* __ipv6 address `<ipv6-address>/<prefix>`__: Establece la direccion y el prefijo para el enrutamiento
	* __ipv6 address `<ipv6-address>` link-local__: Define la direccion de enlace local para la comunicacion LAN
1. router(config-dhcp)# __(Configuracion Servidor)__
	* __ipv6 dhcp pool `<pool-name>`__: Crea un Pool DHCP con el nombre indicado
	* __address prefix `<global-address::/prefix>`__: Establece el prefijo de red para el servicio de dhcp (STATEFUL)
	* __dns-server `<ipv6-address>`__: Establece la direccion del Servidor de Nombres (STATELESS)
	* __domain-name `<network-domain>`__: Define el nombre de Dominio de la topologia (STATELESS)
1. router(config-if)# __(Configuracion Servidor DHCPv6)__
	* __ipv6 dhcp server `<pool-name>`__: Configura la interfaz para funcionar como servidor de dhcp
	* __ipv6 nd other-config-flag__: Habilita el envio de configuracion de Dominio y servidor mediante dhcp (STATELESS)
	* __ipv6 nd managed-config-flag__: Habilita la configuracion de prefijo por parte del servidor dhcp (STATEFUL)
	* __ipv6 nd ra suppress__: Elimina la difusion de mensajes de Router Advertisement (STATEFUL)

## Implementacion

Podemos establecer una configuracion sencilla con __SLAAC (Stateless Adress Auto Configuration)__, para ello simplemente debemos habilitar el _enrutamiento de protocolo IPv6_ y asignar __una direccion global y una local__ a la interfaz que querramos configurar. De esta manera mediante el _protocolo NDP_ el router enviara mensajes de __RA (Router Advertisement)__ indicando el _prefijo_ que deben utilizar los vecinos IPv6.

```sh
ipv6 unicast-routing
!
interface GigabitEthernet 0/0
description SLAAC Interface
ipv6 enable
ipv6 address 2001:db6:acad::1/112
ipv6 address fe80::1 link-local
```

El _inconveniente con la configuracion anterior_ radica en que la configuracion del __Interface-Id__ corre por cuenta del vecino IPv6; por lo tanto, si quisieramos aplicar un _prefijo mayor a 64 bits_ o necesitacemos __informacion adicional__ como el nombre de dominio o direccion del servidor dns, debemos configurar un __servidor DHCPv6__, el cual puede ser _STATELESS o STATEFUL_.

```sh
ipv6 dhcp pool IPv6-STATEFUL
address-prefix 2001:db6:acad::/112
dns-server 2001:4860:4860::8888
domain-name ENTERPRISE.NET
!
interface GigabitEthernet 0/0
ipv6 dhcp server IPv6-STATEFUL
ipv6 nd other-config-flag
ipv6 nd managed-config-flag
ipv6 nd ra supress
```

[volver](../readme.md)