# Seguridad de Puertos

La seguridad de puertos (Port Security) es una característica de los switches Cisco que permite restringir el acceso a un puerto de switch basándose en las direcciones MAC de los dispositivos que se conectan a él. Es una medida de seguridad de capa 2 para prevenir que dispositivos no autorizados se conecten a la red.

1. switch(config-if)# __(Configuración de Interfaz)__
    * __switchport mode access__: Define el puerto como modo de acceso.
    * __switchport port-security__: Habilita la seguridad en el puerto.
    * __switchport port-security maximum `<number>`__: Establece el número máximo de direcciones MAC permitidas.
    * __switchport port-security violation `<mode>`__: Define la acción a tomar en caso de una violación de seguridad.
    * __switchport port-security mac-address `<mac-address>`__: Asigna una dirección MAC estática al puerto.
    * __switchport port-security mac-address `sticky`__: Habilita el aprendizaje dinámico y persistente de direcciones MAC.
2. switch# __(Verificación)__
    * __show port-security interface `<interface-id>`__: Muestra la configuración de seguridad de una interfaz específica.
    * __show port-security address__: Muestra todas las direcciones MAC seguras configuradas en el switch.

## Implementacion

La seguridad de puertos se debe configurar en los puertos de acceso donde se conectan los dispositivos finales. No se recomienda su uso en puertos troncales. El modo "sticky" es muy útil porque combina la flexibilidad del aprendizaje dinámico con la persistencia de la configuración estática, guardando las MAC aprendidas en la `running-config`.

Es importante definir una política de violación. `shutdown` es la más segura, pero requiere intervención manual para reactivar el puerto. `restrict` y `protect` son menos disruptivas.

```sh
interface range FastEthernet 0/1-24
switchport mode access
switchport port-security
!
describe END DEVICES
switchport port-security maximum 5
switchport port-security mac-address sticky
switchport port-security violation shutdown
```

[volver](../readme.md)