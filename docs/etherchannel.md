# Configuracion Etherchannel

Tecnologia que permite agrupar multiples enlaces redundantes de una misma conexion para que funcionen como uno solo y cuyo ancho de banda final se convierte en la sumatoria de estos. La cantidad maxima de interfaces que se pueden utilizar por grupo es de 8.

1. switch(config)# __(asignacion de enlaces)__
    * __interface `port-channel <group-id>`__ Submodo de configuracion de Etherchannel
    * __channel-group `<group-id>` mode `<on>`__ Habilitar Etherchannel incondicionalmente
2. switch(config-if-range)# __(Port aggregation Protocol)__
    * __channel-protocol `<PAgP>`__ Prepara la interfaz para funcionar con PAgP (propietario de CISCO)
    * __mode `<auto>`__ Habilita PAgP cuando se detecta un dispositivo compatible
    * __mode `<desirable>`__ Implementa PAgP incondicionalmente
3. switch(config-if-range)# __(Link aggregation Control Protocol)__
    * __channel-protocol `<LACP>`__ Prepara la interfaz para funcionar con LACP (Estandar abierto)
    * __mode `<passive>`__ Habilita LACP cuando se detecta un dispositivo compatible
    * __mode `<active>`__ Implementa LACP incondicionalmente

## Implementacion

Cuando configuramos un _switch administrable o multicapa_ podemos aplicar la misma configuracion a un __rango de interfaces__ del dispositivo, indicando el modo correspondiente al protocolo que deseamos utilizar, ademas del numero de interfaz portchannel a utilizar que, en caso de no existir, _se creara automaticamente_ al realizar la asignacion. 

Tambien podemos aplicar un modo de _configuracion de switchport_ directamnete a la interfaz portchanel y al hacerlo, esta sera aplicada automaticamente a todas las interfaces que formen parte del mismo.

```sh
interface range GigabitEthernet 1/0/1-4
channel-group 1 mode pagp
!
interface port-channel 1
description TRUNK ETHERCHANNEL
switchport mode trunk
```

Por otro lado, al configurar un router con etherchannel, sera necesario __crear primero la interfaz__ y asignarle una _configuracion ip_ antes de poder asignar la misma a las interfaces fisicas del mismo. 

Tampoco podremos combinar esta configuracion con subinterfaces para la configuracion __Router on a Stick__ con vlans, ya que corresponden a interfaces virtuales de diferente tipo. Aunque se puede utilizar una vlan de acceso y aplicar el enrutamiento intervlan directamente con un switch multicapa.

```sh
interface port-channel-1
ip address 10.0.0.1 255.255.255.0
!
interface range GigabitEthernet 0/0-2
channel-group 1
no shutdown
```

[volver](../readme.md)