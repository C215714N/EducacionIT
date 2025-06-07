# FHS (Filesystem Hierarchy Standard)

Es el conjunto de reglas que determinan una __estructuración común de archivos y directorios__ en los sistemas Linux. Este estándar no es más que un _documento de guía_, el cual puede ser consultado por los fabricantes y ser aplicado al momento de crear una nueva distribución.

## Estructura de Carpetas

Los sistemas Linux residen bajo un __árbol jerárquico de archivos__, bastante parecido a como se estructura los sistemas Unix. En sus inicios no existia ningún estándar y por lo tanto habia variaciones entre el de una distribución y otra, hasta la creacion de FHS en 1993.

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

## Herramientas Comunes

* __fdisk__: Herramienta tradicional para gestionar particiones en discos MBR.
* __gdisk__: Similar a `fdisk`, pero para discos GPT.
* __parted__: Herramienta más flexible que permite gestionar particiones tanto en MBR como GPT.
* __gparted__: Interfaz gráfica para `parted`, ideal para usuarios menos experimentados.

### Linea de Comandos

* Particionado
   * __sudo fdisk -l__: Lista los discos disponibles
   * __sudo fdisk `/dev/sdX`__: Selecciona un disco para particionar
* Formatear Sistema de Archivos
   * __sudo mkfs.ext4 `/dev/sdX1`__: Formatea la particion en ext4
   * __sudo mkdir `/mnt/particion`__: Crea un punto de montaje
   * __sudo mount `/dev/sdX1` `/mnt/particion`__: Monta la partición seleccionada
* Creacion de Particion Swap
   * __sudo mkswap /dev/sdX2__: Crear una partición swap
   * __sudo swapon /dev/sdX2__: Activar el área de intercambio
   * __free -h__: Verificar swap activo

[volver](../readme.md)