# Protocolo de Enrutamiento redundante

__Hot Standby Router Protocol__ es un protocolo propietario de Cisco que busca asegurar la disponibilidad del servicio de puerta de enlace al hacer partícipes de este servicio a varios routers. Se utiliza en un grupo de routers para seleccionar un dispositivo activo y un dispositivo de respaldo. El dispositivo activo es aquel que se utiliza para enrutar paquetes, y el dispositivo de respaldo es el que toma el control cuando falla el dispositivo activo o cuando se cumplen condiciones previamente establecidas.

1. router(config-if)# __(configuracion de interfaz)__
	* __standby ip `<address>`__ define la direccion del router virtual HSRP.
	* __standby track `<interface-id>`__ realiza seguimiento de la interfaz de salida
	* __standby preempt__ reduce la prioridad cuando la interfaz de salida falla
2. router# __(verificacion de la configuracion)__
	* __show standby__ muestra la configuracion hsrp implementada
	* __show standby brief__ resumen que muestra los dispositivos activo y de respaldo

| Campo | Descripción | 
|-|-|
| Group Number | Número de grupo HSRP. | 
| Priority | Determina el router activo. | 
| Virtual IP | IP que comparten los routers. | 
| Hello Time | Intervalo entre mensajes Hello. |

## Implementacion

En caso de no especificar el grupo al que pertenece la interfaz standby, se utilizara el valor 0 como valor del mismo, siendo algo bastante practico para una rapida configuracion del protocolo. Para la configuracion de los routers, debemos garantizar que la interfaz configurada de cada dispositivo corresponda a la misma red y la ip virtual sea la misma para todos, de lo contrario no se aplicara la configuracion.

```sh
interface GigabitEthernet0/0
ip address 10.0.0.253 255.255.255.0
standby ip 10.0.0.254
standby track Serial 0/0/0
standby prempt
```

En caso de utilizar un switch multicapa, podemos aprovechar que las interfaces fisicas no se encuentran asociadas a una red, sino que dependen de sus interfaces vlan, permitiendo una mayor flexibilidad a la hora de configurar un router virtual; tambien podemos aprovechar las funciones de seguimiento de interfaces, para reducir de 10 en 10 la prioridad en caso que alguna deje de funcionar, y de esta manera cambie el dispositivo activo.


```sh
interface vlan 101
ip address 10.0.1.253 255.255.255.0
standby 101 ip 10.0.0.126
standby 101 track GigabitEthernet 1/1/1
standby 101 prempt
```

[volver](../readme.md)