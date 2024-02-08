# Sistema de Archivos

Los sistemas Linux residen bajo un __árbol jerárquico de archivos__, bastante parecido a como se estructura los sistemas Unix. En sus inicios no existia ningún estándar y por lo tanto habia variaciones entre el de una distribución y otra, hasta la creacion de FHS en 1993.



## FHS (Filesystem Hierarchy Standard)
 
Es el conjunto de reglas que determinan una __estructuración común de archivos y directorios__ en los sistemas Linux. Este estándar no es más que un _documento de guía_, el cual puede ser consultado por los fabricantes y ser aplicado al momento de crear una nueva distribución.


| Directorio | Descripción|
|--|--|
| __/__ |Jerarquía primaria, denominado __root__ o raíz, __directorio principal__, contenedor del absolutamente todo el sistema de archivos en Linux |
| __/bin/__|Contiene los binarios de __comandos indispensables__, disponibles para una sesión única o multiusuarios, como _ls, cp, cat, mkdir, rm,_ etc |
| __/boot/__|El arranque del sistema|
| __/dev/__|Contiene los accesos hacia los dispositivos, tanto hardware como virtuales |
| __/etc/__|Contiene los _archivos de configuracion del sistema_. Interpretaciones más recientes lo denominan como "Configuración de texto editable"|
| __/home/__|Contiene los __directorios de trabajo__ de todos los usuarios, excepto el del superusuario. Contiene archivos guardados, ajustes personales, etc. Cada usuario tiene su propio directorio dentro de esta carpeta|
| __/lib/__|Se localizan todas las bibliotecas fundamentales compartidas de los programas instalados incluyendo también las utilizadas por el núcleo|
| __/media/__|Contiene los puntos de montaje de los _medios extraíbles de almacenamiento_|
| __/mnt/__|Es similar a /media, pero normalmente __utilizado por los usuarios__. Con el fin de "montar" _discos duros y particiones temporales_|
| __/opt/__|Contiene información de aplicaciones que no guardan las opciones de configuración en este directorio, es decir, los usuarios comparten la aplicación mas no las opciones de configuración de la misma|
| __/proc/__|Contiene archivos que documentan el núcleo y el estado de sus procesos en específicos momentos|
| __/root/__| Directorio principal del usuario root, similar a /home, pero para el __superusuario (administrador) del sistema__|
| __/sbin/__|Ejecutables o __binarios esenciales__ para el funcionamiento, comandos y programas _exclusivos del administrador del sistema_ o usuarios que tengan permisos para hacer uso de ellos|
| __/srv/__|Contiene los datos servidos por el sistema|
| __/tmp/__|Contiene los archivos temporales|
| __/usr/__|jerarquía secundaria de datos de usuario, contiene la mayoría de utilidades que son de propósito multiusuario pero que sin embargo son de solo lectura |
| __/var/__|Contiene los __archivos variables del sistema__, como logs, bases de datos, correo electrónico|

[volver](../readme.md)