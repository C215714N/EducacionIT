# BPDU Guard

BPDU Guard es una característica de seguridad de Spanning Tree Protocol (STP) que protege la integridad de la topología de red. Cuando se habilita en un puerto, si este recibe una BPDU (Bridge Protocol Data Unit), BPDU Guard pondrá el puerto en estado `err-disabled` (deshabilitado por error), previniendo que un switch no autorizado participe en la topología STP y potencialmente se convierta en el Root Bridge.

1. switch(config)# __(Configuración Global)__
    * __spanning-tree portfast bpduguard default__: Habilita BPDU Guard en todos los puertos que tienen PortFast habilitado.
2. switch(config-if)# __(Configuración de Interfaz)__
    * __spanning-tree bpduguard enable__: Habilita BPDU Guard en una interfaz específica, independientemente de la configuración de PortFast.

## Implementacion

BPDU Guard está diseñado para usarse en puertos de acceso donde se conectan dispositivos finales (como PCs, impresoras, etc.), los cuales nunca deberían generar BPDUs. Generalmente se combina con PortFast, que permite que el puerto entre en estado de reenvío inmediatamente. La forma más común de implementarlo es habilitándolo globalmente para todos los puertos con PortFast.

```sh
spanning-tree portfast bpduguard default
!
interface range FastEthernet0/1-24
description CLIENT INTERFACE
switchport mode access
spanning-tree portfast
```

[volver](../readme.md)
