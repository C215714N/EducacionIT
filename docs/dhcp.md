# Servidor de DHCP

__Dynamic Host Configuration Protocol__ asigna direcciones IPv4 y otra información de configuración de red dinámicamente. Debido  a que los _clientes de escritorio_ suelen componer gran parte de los nodos de red, este protocolo es una herramienta extremadamente útil para los __administradores de red__, ya que permite ahorrar mucho tiempo, al momento de _configurar equipos_.

1. router(dhcp-config) __(Configuracion de Servicio)__
    * __ip dhcp excluded-address `<start>``<end>`__: Define que direcciones no seran entregadas por servicio de DHCP
    * __ip dhcp pool `<pool-name>`__: Crea un pool de direcciones con el nombre solicitado 
    * __network `<address>` `<mask>`__: Establece la red a la que pertenece el servicio de DHCP configurado
    * __default-router `<address>`__: Indica la puerta de enlace predeterminada para la configuracion del cliente
    * __dns-server `<address>`__: Configura la direccion del servidor dns a utilizar
    * __domain-name `<domain>`__: Establece el nombre de dominio de la red configurada con DHCP

## Implementacion

Lo primero que debemos configurar son las __exclusiones__, es decir, aquellas direcciones que _no queremos que sean asignadas_ a los clientes, y luego procedemos con la __configuracion del servicio__. Una vez configurado el _grupo de direcciones_ de dhcp, podremos implementarla mediante la _configuracion ip_ de una de las __interfaces locales__ del dispositivo, debiendo pertenecer a la _misma red declarada en el pool dhcp_ configurado previamente, indistintamente que este sea el gateway o no.

```sh
ip dhcp excluded address 10.0.0.0 10.0.0.10
!
ip dhcp pool DHCP-LAN
network 10.0.0.0 255.255.255.0
default-router 10.0.0.1
dns-server 8.8.8.8
domain-name ENTERPRISE.NET
!
interface GigabiEthernet 0/0
description CLIENT INTERFACE
ip address 10.0.0.10 255.255.255.0
no shutdown
```

[volver](../readme.md)