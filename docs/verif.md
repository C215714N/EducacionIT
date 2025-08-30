# Verificacion de Topologia

Cuando establecemos la configuracion de los dispositivos de internetworks debemos verificar el funcionamiento de las interfaces, redes y dispositivos a los que se conecte dentro de la topologia. La misma dependera del tipo de dispositivo que estemos administrando.

1. switch# __(administracion general)__
	* __show version__: Informacion del Sistema Operativo y version
	* __show flash__: Lista de archivos de la memoria FLASH
	* __show running-config__: Configuracion actual almacenada en la RAM
	* __show startup-config__: Configuracion de inicio almacenada en la NVRAM
1. switch# __(administracion del conmutador)__
	* __show interfaces status__: Interfaces del dispositivo con su configuracion capa 2 resumida
	* __show interfaces `<interface id>`__: Detalle el funcionamiento de la interfaz seleccionada
	* __show mac address-table__: Tabla de direcciones MAC registradas por interfaz
1. router# __(administracion del enrutador)__
	* __show arp__: Tabla de direcciones IP aprendidas con sus MAC correspondientes
	* __show ip interfaces brief__: Interfaces del dispositivo con su configuracion capa 3 resumida
	* __show ip route__: Tabla de rutas a las que esta conectado o se puede acceder

## Implementacion

En caso de trabajar con un switch podemos verificar las candidad de hosts que tienen acceso al mismo, ademas de la configuracion de las interfaces del mismo. Debemos recordar que, si bien no es obligatorio, es necesario configurar una direccion IP a una de las VLANs del dispositivo para poder acceder remotamente al mismo.

```sh
show interfaces status
show mac address-table
```

Ya sea que utilicemos un router o configuremos un switch, una vez configurada la direccion IP para la interfaz que vayamos a utilizar, podemos corroborar su correcta configuracion, ademas de las direcciones vecinas aprendidas a traves del protocolo ARP. Debemos tener en cuenta que el switch unicamente agregara las direcciones con las que haya tenido comunicacion directa.

```sh
show arp
show ip interfaces brief
show ip route
```

[volver](../readme.md)