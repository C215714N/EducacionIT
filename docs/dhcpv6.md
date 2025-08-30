## Direccionamiento IPv6 con Servicio de DHCP

Es un protocolo cliente-servidor que proporciona una configuración administrada de dispositivos sobre IPv6. DHCPv6 funciona sobre el protocolo de transporte UDP. El cliente utiliza una dirección link-local u otra determinada a través de otros mecanismos para transmitir y recibir los mensajes DHCPv6.

1. router(config)# __(Enrutamiento IPv6)__
	* __ipv6 unicast-routing__ Habilita el enrutamiento de paquetes IPv6 y mensajes Router Advertisement
	* __ipv6 dhcp pool `<pool-name>`__ Crea un Pool DHCP con el nombre indicado
2. router(config-dhcp)# __(DHCP StateLess)__
	* __dns-server `<ipv6-address>`__ Establece la direccion del Servidor de Nombres
	* __domain-name `<network-domain>`__ Define el nombre de Dominio de la topologia
3. router(config-dhcp)# __(DHCP StateFul)__
	* __address prefix `<2002:acad:db6::/64>`__ Establece el prefijo de red para el servicio de dhcp
4. router(config-if)# __(StateLess Adress AutoConfiguracion)__
	* __ipv6 enable__ Habilita el protocolo IPv6 en la interfaz seleccionada
	* __ipv6 address `<2002:acad:db6::1/64>`__ Establece la direccion y el prefijo para el enrutamiento
	* __ipv6 address `<fe80::01>` link-local__ Define la direccion de enlace local para la comunicacion LAN
5. router(config-if)# __(Configuracion Servidor DHCPv6)__
	* __ipv6 dhcp server `<pool-name>`__ Configura la interfaz para funcionar como servidor de dhcp
	* __ipv6 nd other-config-flag__ Habilita el envio de configuracion de Dominio y servidor mediante dhcp (stateless)
	* __ipv6 nd managed-config-flag__ Habilita la configuracion de prefijo por parte del servidor dhcp (stateful)
