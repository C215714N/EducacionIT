# Fundamentos de redes

Esto es una guia para los alumnos del capacitacion __ccna 1__ que cursan los dias _martes de 17hs a 20hs_, donde podran descargar los contenidos trabajados en clase y revisar el material.

## Programas
* [Packet Tracer](https://skillsforall.com/resources/lab-downloads?userLang=es-XL&courseLang=en-US)
* [Wireshark](https://www.wireshark.org/)
* [PuTTY](https://putty.org/)
* [Driver Identifier](https://www.driveridentifier.com/blog/?p=149)

## Tabla de contenidos

* [Configuracion Inicial](#configuracion-inicial)

## Configuracion Inicial

Cuando configuramos un dispositivo de internetworks por primera vez, debemos hacerlo utilizando el *cable de consola (RS-232)* ya que se se encuentra por fuera de la banda de red y solamente podemos acceder a su configuracion utilizando este elemento.

1. Switch> (modo estandar)
	* __enable__: habilita el modo privilegiado
2. Switch# (modo privilegiado)
	* __configure terminal__: accede al modo de configuracion global
3. Switch(config)# (modo configuracion global)
	* __hostname `<name>`__: define el nombre del dispositivo
	* __ip domain name `<domain>`__: define el nombre de dominio al que pertenece el dispositivo.
	* __banner motd `#message#`__: establece el mensaje de acceso necesario para cuestiones legales
