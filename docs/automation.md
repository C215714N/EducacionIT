# Automatizacion y Programabilidad

La automatizacion de red utiliza software para configurar, gestionar y monitorear dispositivos, reduciendo el error humano y aumentando la velocidad de despliegue.

* __SDN (Software Defined Networking):__ Arquitectura que separa el plano de control (inteligencia) del plano de datos (reenvio).
* __APIs (Application Programming Interfaces):__ Interfaces que permiten que las aplicaciones se comuniquen con los dispositivos de red (RESTful APIs).
* __Formatos de Datos:__ __JSON__ (JavaScript Object Notation) es el formato mas utilizado para el intercambio de datos en automatizacion.
* __Herramientas de Gestion de Configuracion:__
  * __Puppet:__ Basado en Ruby, utiliza un modelo "pull".
  * __Chef:__ Basado en Ruby, utiliza un modelo "pull".
  * __Ansible:__ Basado en Python, utiliza un modelo "push" a traves de SSH (no requiere agentes).

## Controladores SDN

* __Cisco DNA Center:__ Controlador para redes empresariales.
* __APIC-EM:__ Controlador para redes WAN y de campus.

## Implementacion (Formato JSON)

La implementación de automatización requiere considerar los diferentes entornos y herramientas disponibles:

1. **Entornos de laboratorio (Packet Tracer, EVE-NG)**: JSON facilita la importación/exportación de configuraciones. NETCONF/YANG es preferible cuando se requiere sincronización completa del estado del dispositivo.
2. **Data Center con dispositivos Nexus**: Se utilizan APIs REST de NX-API o gRPC con JSON. Los modelos YANG estandar (OpenConfig) aseguran interoperabilidad con múltiples vendors.
3. **Redes empresariales distribuidas**: Ansible con playbooks YAML es la opción más común, usando `network_cli` o `netconf` connection plugins. Los comandos `show running-config` en JSON (`display format json`) facilitan el parsing.

4. **Consideraciones de seguridad**:
   - Usar HTTPS/TLS para APIs REST
   - Configurar `transport default-methods` para autenticación basada en certificados
   - Implementar AAA con privilegios restringidos para cuentas de automatización

5. **Buenas prácticas**:
   - Versionar configuraciones antes de cambios
   - Usar templating (Jinja2) para configuraciones parametrizadas
   - Implementar validación de esquemas JSON antes de enviar a dispositivos

```json
{
  "ietf-interfaces:interface": {
    "name": "GigabitEthernet1",
    "description": "Enlace Troncal",
    "type": "iana-if-type:ethernetCsmacd",
    "enabled": true,
    "ietf-ip:ipv4": {
      "address": [
        {
          "ip": "192.168.1.1",
          "netmask": "255.255.255.0"
        }
      ]
    }
  }
}
```

[volver](../readme.md)
