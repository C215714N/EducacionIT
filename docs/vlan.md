## Virtual Local Area Network

Una VLAN es una red lógica que agrupa un conjunto de dispositivos dentro de una red física, permitiendo que estos dispositivos se comuniquen entre sí como si estuvieran en la misma red local, sin importar su ubicación física. Las VLANs se utilizan para segmentar redes grandes en _redes más pequeñas, mejorar la seguridad, y gestionar el tráfico de red de manera más eficiente_.

### Características:

* __Segmentación__: Reduce el tamaño del dominio de difusión y mejora el rendimiento de la red.
* __Seguridad__: Solo los dispositivos dentro de la misma VLAN pueden comunicarse directamente entre sí.
* __Flexibilidad__: Agrupa dispositivos por funcion, departamento, etc, independientemente su ubicación.
* __Reducción de Tráfico__: Limitan la difusión de paquetes a los dispositivos dentro de la misma VLAN.
* __Administración Sencilla__: Los cambios en la topología no requieren de reconfiguración física.

### Implementacion:

1. __Segmentación por Departamento__: En una empresa, se pueden crear VLANs para separar el tráfico de la red entre los departamentos de administracion, facturacion y ventas.
2. __Separación de Red de Invitados__: En una organización, se puede crear una VLAN específica para los dispositivos de invitados, separándolos de la red interna para mejorar la seguridad.
3. __Segmentación por Ubicación__: En una empresa con múltiples sucursales, se pueden crear VLANs para dividir la red por ubicación geográfica, facilitando la gestión y asegurando que el tráfico local permanezca dentro de la sucursal.

* Switch(config-vlan)#: __(Creacion de VLANs)__
    * __vlan `10`__: crea una vlan con el id especificado
    * __name `ventas`__: asigna el nombre a la vlan actual
* Switch(config-if)#: __(Asignacion de Interfaces)__
    * __interface `fastEthernet 0/1`__: ingresa a la interfaz especificada
    * __switchport mode `access`__: configura la interfaz en modo de acceso
    * __switchport access `vlan 10`__: establece a que vlan pertence la interfaz
* Switch(config-if)#: __Configuración de Trunking__:
    * __interface `gigabitEthernet 0/1`__: selecciona la interfaz especificada
    * __switchport mode `trunk`__: configura la interfaz en modo troncal para el trafico de vlans
* Switch# __Verificación__:
    * __show interfaces `status`__: muestra el estado de cada interfaz
    * __show vlan `brief`__: muestra un resumen de la configuracion de vlans