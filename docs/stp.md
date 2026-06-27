# Protocolo spanning-tree

Los _dispositivos administrables_ por defecto vienen con el protocolo de arbol de expansion activado, que se utiliza para __prevenir los bucles a nivel de capa 2__. Si bien en la mayoria de los casos no hace falta definir esta configuracion, en una __red convergente o jerarquica__ es necesario para un _funcionamiento eficiente_.

1. switch(config)# __(configuracion global)__
    * __spanning-tree vlan `<vlan-id>` priority `<0-61440>`__: habilita el protocolo en la vlan seleccionada y establece el nivel de prioridad para definir el Root-Bridge entre los dispositivos que utilizan este protocolo.
	* __spanning-tree vlan `<vlan-id>` root `<priority>`__: Indica el estado que debe considerarse, primary o secondary, estableciendo como prioridad predeterminada 24576 y 28672 respectivamente.
    * __spanning-tree mode `<rapid-pvst>`__: define el modo de funcionamiento Rapido para disminuir el tiempo de convergencia de la topologia, debido a que se omiten las etapas de escucha y aprendizaje.
2. switch# __(verificacion spanning-tree)__
	* __show spanning-tree__: muestra la configuracion indicando el Bridge-Id del dispositivo y el Root-Bridge de cada VLAN
	* __show spanning-tree summary__ indica el estado de las interfaces fisicas (block, learning, listening, forwarding) de cada VLAN
	* __show spanning-tree detail__: devuelve la configuracion aplicada en cada interfaz fisica del dispositivo (cost, identifier, priority)

## Implementacion

Cuando utilizamos spanning-tree debemos establecer como __root-bridge__ al dispositivo mas cercano a la __capa de nucleo__, porque de esta manera, solamente se bloquearan los enlaces redundantes, obteniendo el _trayecto mas directo_ hacia dicho switch, _optimizando la comunicacion_ con redes externas.

```sh
spanning-tree mode rapid-pvst
spanning-tree VLAN 10 priority 20480
```

[volver](../readme.md)