# Virtual Local Area Network

Una VLAN es una red lógica que agrupa un conjunto de dispositivos dentro de una red física, permitiendo que estos dispositivos se comuniquen entre sí como si estuvieran en la misma red local, sin importar su ubicación física. Las VLANs se utilizan para segmentar redes grandes en _redes más pequeñas, mejorar la seguridad, y gestionar el tráfico de red de manera más eficiente_.

| Caracteristica | Descripcion |
|-|-|
| __Segmentación__ | Reducen el tamaño del dominio de difusión y mejora el rendimiento de la red |
| __Optimizacion__ | Reducen el Tráfico, limitando la difusión a los dispositivos dentro de la misma VLAN |
| __Flexibilidad__ | Permiten agrupar dispositivos por funcion, depto, etc..., independientemente su ubicación |
| __Administración__ | Los cambios en la topología no requieren de reconfiguración física de la red |
| __Seguridad__ | Solo los dispositivos dentro de la misma VLAN pueden comunicarse directamente entre sí |

## Implementacion:

* __Segmentación por Departamento__: En una empresa, se pueden crear VLANs para separar el tráfico de la red entre los departamentos de administracion, facturacion y ventas.
* __Separación de Red de Invitados__: En una organización, se puede crear una VLAN específica para los dispositivos de invitados, separándolos de la red interna para mejorar la seguridad.
* __Segmentación por Ubicación__: En una empresa con múltiples sucursales, se pueden crear VLANs para dividir la red por ubicación geográfica, facilitando la gestión y asegurando que el tráfico local permanezca dentro de la sucursal.

## Configuracion

Cuando accedemos a un Switch administrable, debemos configurar sus interfaces virtuales para habilitar su configuracion de capa de red, ademas del acceso remoto.

* __Configuracion de nombres__
    ```sh
    vlan 10
    name SALES # nombre asociado a vlan 10
    vlan 20
    name GUEST # nombre asociado a vlan 20
    ```
* __Configuracion de Interfaces VLAN__
    ```sh
    interface vlan 10
    ip address 192.168.10.2 255.255.255.0 # direccion ip SALES
    interface vlan 20
    ip address 192.168.20.2 255.255.255.0 # direccion ip GUEST
    ```
* __Configuracion tipos de Enlace__
    ```sh
    interface range FastEthernet 0/1-12 # interfaces asociadas a SALES
    switchport access vlan 10
    interface range FastEthernet 0/13-24 # interfaces asociadas a GUEST
    switchport access vlan 20
    interface range GigabitEthernet 0/1-2 # interfaces en modo troncal
    switchport mode trunk
    switchport trunk allowed VLAN 10,20 # vlans permitidas
    ```

## Verificacion 

Podemos corroborar si las VLAN fueron asignadas correctamente y si los enlaces troncales estan funcionando utilizando los siguientes comandos de verificacion.

* __Switch#__ (Comandos de Verificación):
    * __show interfaces `status`__: muestra el estado de cada interfaz
    * __show vlan `brief`__: muestra un resumen de la configuracion de vlans
    * __show interfaces `trunk`__: muestra la interfaces configuradas como troncales

[volver](../readme.md)