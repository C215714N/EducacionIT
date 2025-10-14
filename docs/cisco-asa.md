# Cisco ASA

__Cisco Adaptive Security Appliance__ es un dispositivo de firewall con capacidades avanzadas como NAT y VPN. Cisco ASA ofrece control granular del tráfico con sus listas de acceso y configuraciones de NAT. Implementar estas medidas mejora significativamente la seguridad de la infraestructura, ya que protege las redes internas de amenazas externas, brindando _control detallado sobre el tráfico entrante y saliente_ y además ofrece funciones de VPN, filtrado de tráfico y prevención de intrusiones.

## Características

* __Seguridad Avanzada__: El ASA proporciona inspección profunda de paquetes, filtrado y control de acceso para proteger contra amenazas externas.
* __Alto Rendimiento__: Soporta altas velocidades de tráfico y múltiples conexiones simultáneas sin comprometer la seguridad.
* __VPN (Virtual Private Network)__: Permite la conexión segura de usuarios remotos o sucursales a la red corporativa a través de VPN.
* __Control de Tráfico__: Configuración granular de políticas de acceso y filtrado para gestionar el flujo de tráfico entre redes internas y externas.
* __Escalabilidad__: El ASA se adapta a redes de diferentes tamaños, desde pequeñas empresas hasta grandes corporativos.

## Implementación

1. __Definir Políticas de Seguridad__: Configurar reglas de acceso para controlar qué tráfico puede entrar o salir de la red, basado en direcciones IP, protocolos, puertos y otros criterios.
2. __Establecer VPNs__: Configurar VPNs para permitir el acceso remoto seguro o interconexión de redes de sucursales a través de túneles cifrados.
3. __Monitoreo y Auditoría__: Implementar herramientas de monitoreo para supervisar el tráfico y generar alertas sobre posibles amenazas.

## Configuración

Para comenzar con la configuración de un Cisco ASA, es necesario acceder al dispositivo y configurar las interfaces, así como la política básica de seguridad.

* __Configuracion LAN de Interfaz Interna__
    ```sh
    interface GigabitEthernet0/1
    nameif inside
    security-level 100 # nivel por defecto para inside
    ip address 192.168.1.1 255.255.255.0
    no shutdown
    ```
* __Configuracion WAN de Interfaz Externa__
    ```sh
    interface GigabitEthernet0/2
    nameif outside
    security-level 0 # valor predeterminado
    ip address dhcp setroute
    no shutdown
    ```
* __Configuración de Políticas de Seguridad__
    ```sh
    access-list outside_access_in extended permit tcp any host 192.168.1.1 eq www # permite el trafico http entrante
    access-group outside_access_in in interface outside # permite todo el trafico saliente
    object network obj_any
    subnet 192.168.1.0 255.255.255.0
    nat (inside,outside) dynamic interface # habilita la implementacion de NAT
    ```
* __Configuracion VPN SSL/IPsec__
    ```sh
    vpn-tunnel-group VPN_Remoto type remote-access
    vpn-tunnel-group VPN_Remoto general-attributes
    address-pool VPN_Pool # configuracion general del tunel
    tunnel-group VPN_Remoto ipsec-attributes
    ikev1 pre-shared-key cisco123 # configuracion ipsec
    ```

## Verificación

Para corroborar que la configuración del ASA es correcta y que las políticas están funcionando según lo esperado, puedes utilizar los siguientes comandos de verificación.

* __ciscoasa#__ (Comandos de verificacion)
    * __show interface__: Verifica las Interfaces Configuradas
    * __show conn__: Indica las Conexiones Activas
    * __show access-list__: Muestra las ACLs Configuradas
    * __show vpn-sessiondb__: Verifica el Estado de las VPNs

[volver](../readme.md)