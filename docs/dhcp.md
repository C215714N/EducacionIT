# DHCP (Dinamyc Host Configuration Protocol)

Extensión del protocolo __Bootstrap (BOOTP)__ desarrollado en 1985 para conectar dispositivos como terminales y estaciones de trabajo sin disco duro con un Bootserver, del cual reciben su sistema operativo. 

DHCP se desarrolló como solución para redes de gran envergadura y ordenadores portátiles y por ello complementa a BOOTP, entre otras cosas, por su capacidad para asignar automáticamente direcciones de red reutilizables y por la existencia de posibilidades de configuración adicionales.

Tras unas primeras definiciones del protocolo en 1993 en los __RFC 1531__ y __1541__, su especificación definitiva llegó en 1997 con el __RFC 2131__. La _IANA (Internet Assigned Numbers Authority)_ provee al protocolo de los puertos UDP 67 y 68; y los puertos 546 y 547 para IPv6.

```yaml
subnet 192.168.0.0 netmask 255.255.255.0 {
    range 192.168.0.100 192.168.0.200;
    option subnet-mask 255.255.255.0;
    option routers 192.168.0.1;
    option domain-name-servers 8.8.8.8, 8.8.4.4;
    default-lease-time 600;
    max-lease-time 7200;
}
```


```yaml
subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.100 192.168.1.200;
    option routers 192.168.1.1;
    option subnet-mask 255.255.255.0;
    option domain-name-servers 8.8.8.8, 8.8.4.4;
    option domain-name "example.com";
    default-lease-time 600;
    max-lease-time 7200;
    
    host server1 {
        hardware ethernet 00:0C:29:4E:8B:85;
        fixed-address 192.168.1.50;
    }

    host laptop1 {
        hardware ethernet 00:1A:A0:1A:4B:1E;
        fixed-address 192.168.1.101;
    }
}
```

# Configuracion dhcpd

| Option | Descripcion |
|--|--|
| __subnet__| Bloque de direcciones IP y configuración para una subred específica |
| __range__| Rango de direcciones IP que el servidor DHCP puede asignar a los clientes |
| __option routers__| Dirección IP de la puerta de enlace predeterminada para los clientes |
| __option subnet-mask__| Máscara de subred que se debe enviar a los clientes |
| __option domain-name-servers__| Servidores DNS que se deben enviar a los clientes|
| __option domain-name__| Nombre de dominio que se debe enviar a los clientes|
| __default-lease-time__| Tiempo de duracion predeterminado para las direcciones IP asignadas a los clientes |
| __max-lease-time__| Tiempo máximo de duracion para las direcciones IP asignadas a los clientes|
| __host__| Configuraciones específicas para hosts basadas en su dirección MAC |
| __fixed-address__| Reserva una dirección IP para un host identificado por su dirección MAC |
| __subnet-mask__| Define la máscara de subred específica |
| __range dynamic-bootp__| Especifica un rango de direcciones IP que se pueden asignar a clientes de arranque dinámico (BOOTP)|
| __allow/deny__| Permite o deniega el acceso a los servicios DHCP basado en IP, MAC o host |
| __filename__| Archivo que los clientes deben buscar al iniciar el _arranque de red_|
| __next-server__| Servidor TFTP del cual los clientes deben descargar el archivo _filename_|

[volver](../readme.md)