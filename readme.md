# Fundamentos CCNA (Cisco Certified Network Associated)

Esto es una guia practica para los alumnos del curso de redes CCNA1 que cursan los dias lunes y miercoles en EducacionIT

## Programas Necesarios
* [Packet Tracer](https://skillsforall.com/resources/lab-downloads?userLang=es-XL)
* [Wireshark](https://wireshark.org/#download)
* [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)


## Tabla de Contenidos
1. [configuracion incial](#configuracion-inicial)

## configuracion inicial
Cuando configuramos un dispositivo de internetworks por primera vez, debemos hacerlo utilizando el *cable de consola (RS-232)* ya que se se encuentra por fuera de la banda de red y solamente podemos acceder a su configuracion utilizando este elemento.

1. Switch> (modo estandar)
	* __enable__: habilita el modo privilegiado
2. Switch# (modo privilegiado)
	* __configure terminal__: accede al modo de configuracion global
3. Switch(config)# (modo configuracion global)
	* __hostname `<name>`__: define el nombre del dispositivo
	* __banner motd `#message#`__: establece el mensaje de acceso necesario para cuestiones legales