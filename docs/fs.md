# Sistema de Archivos

Los sistemas Linux residen bajo un __árbol jerárquico de archivos__, bastante parecido a como se estructura los sistemas Unix. En sus inicios no existia ningún estándar y por lo tanto habia variaciones entre el de una distribución y otra, hasta la creacion de FHS en 1993.

## FHS (Filesystem Hierarchy Standard)
 
Es el conjunto de reglas que determinan una __estructuración común de archivos y directorios__ en los sistemas Linux. Este estándar no es más que un _documento de guía_, el cual puede ser consultado por los fabricantes y ser aplicado al momento de crear una nueva distribución.

| Directorio | Descripción|
|--|--|
| __/__ |Jerarquía primaria, denominado __root__ o raíz, __directorio principal__, contenedor del absolutamente todo el sistema de archivos en Linux |
| __/bin/__|Contiene los binarios de __comandos indispensables__, disponibles para una sesión única o multiusuarios, como _ls, cp, cat, mkdir, rm,_ etc |
| __/boot/__| Contiene los __archivos de inicio y kernel__ del Sistema. Algunas distribuciones, incluyen datos del GRUB "Gran cargador de arranque unificado" |
| __/dev/__|Contiene los accesos hacia los dispositivos, tanto hardware como virtuales |
| __/etc/__|Contiene los _archivos de configuracion del sistema_. Interpretaciones más recientes lo denominan como "Configuración de texto editable"|
| __/home/__|Contiene los __directorios de trabajo__ de los usuarios, a excepcion del superusuario, como archivos guardados, ajustes personales, etc. |
| __/lib/__|Se localizan todas las bibliotecas fundamentales compartidas de los programas instalados incluyendo también las utilizadas por el núcleo|
| __/media/__|Contiene los puntos de montaje de los _medios extraíbles de almacenamiento_|
| __/mnt/__|Es similar a /media, pero normalmente __utilizado por los usuarios__. Con el fin de "montar" _discos duros y particiones temporales_|
| __/opt/__|Contiene información de aplicaciones que no guardan las opciones de configuración localmente, los usuarios solo comparten la aplicación|
| __/proc/__|Contiene archivos que documentan el núcleo y el estado de sus procesos en específicos momentos|
| __/root/__| Directorio principal del usuario root, similar a /home, pero para el __superusuario (administrador) del sistema__|
| __/sbin/__|Ejecutables o __binarios esenciales__ para el funcionamiento, comandos y programas _exclusivos del administrador del sistema_ o usuarios que tengan permisos para hacer uso de ellos|
| __/srv/__|Contiene los datos servidos por el sistema|
| __/tmp/__|Contiene los archivos temporales|
| __/usr/__|jerarquía secundaria de datos de usuario, contiene la mayoría de utilidades que son de propósito multiusuario pero que sin embargo son de solo lectura |
| __/var/__|Contiene los __archivos variables del sistema__, como logs, bases de datos, correo electrónico|

## /etc/

| Directorio | Descripcion |
|--|--|
| __/etc/opt/__ |Archivos de configuracion de los programas localizados dentro del directorio __/opt__|
| __/etc/X11/__ |Archivos de configuracion del _X Window System_, versión 11|
| __/etc/sgml/__ |Archivos configurativos de SGML "Lenguage de Marcado Generalizado Estandar"|
| __/etc/xml/__ |Archivos configurativos de XML "Lenguage de Marcado Extendido"|

## /usr/

| Directorio | Descripcion |
|--|--|
| __/usr/bin/__ |Comandos binarios no administrativos para todos los usuarios|
| __/usr/include/__ |Archivos de inclusión estándar|
| __/usr/lib/__ |Conjunto de bibliotecas o binarios compartidos. Nunca hay dos bibliotecas idénticas en el mismo sistema, lo cual optimiza el uso de memoria y provee mayor orden|
| __/usr/sbin/__ |Binarios que no son esenciales; por ejemplo, daemons para tener varios servicios de red|
| __/usr/share/__ |Contiene los datos que son compartidos pero que son independientes de la arquitectura|
| __/usr/src/__ |Contiene los códigos fuentes de algunas aplicaciones|
| __/usr/X11R6/__ |Directorio relacionado al entorno gráfico|
| __/usr/local/__ |Jerarquía terciaria para datos locales, es decir, específicos a este host|


## /var/

| Directorio | Descripcion |
|--|--|
| __/var__/cache/ |Similar a /tmp, contiene la memoria cache de algunas aplicaciones|
| __/var__/crash/ |Contiene información referente a errores o caídas del sistema|
| __/var__/games/ |Es un directorio que no es imprescindible y su propósito es almacenar información referente a los juegos del sistema|
| __/var__/lock/ |Se localizan los archivos que tienen el estado de los recursos en uso|
| __/var__/log/ |Archivos de logs|
| __/var__/mail/ |Archivos de mensajes de usuarios, correos similares|
| __/var__/opt/ |Contiene los datos que pueden ser variables del directorio /opt|
| __/var__/run/ |Acceso a información desde el ultimo arranque del sistema. Por ejemplo, usuarios conectados en ese instante, o demonios en ejecución|
| __/var__/spool/ |Incluye las tareas que están en espera para procesar. Por ejemplo, correos no leídos o colas de impresión|
| __/var__/spool/mail/ |Localización de los correos de usuarios desaprobados|
| __/var__/tmp/ |Contiene archivos temporales, su diferencia con /tmp es el hecho de no borrarse al reiniciar el sistema|

[volver](../readme.md)