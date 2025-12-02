# Gestión de Usuarios y Grupos

En sistemas operativos tipo Unix (como Linux), la administración de usuarios y grupos es una tarea esencial para la seguridad y organización del sistema. Los usuarios se utilizan para acceder al sistema, mientras que los grupos permiten organizar a los usuarios con permisos similares.

* __useradd__: crea un nuevo usuario con las configuracion predeterminadas
    | param | descripcion | ejemplo |
    |-|-|-|
    | __-m__ | Crea un nuevo usuario y su directorio home | sudo useradd __-m__ _username_ |
    | __-s__ | Especifica el shell predeterminado para el usuario | sudo useradd __-s__ `/bin/bash` _username_ |
    | __-g__ | Especifica el grupo principal del usuario | sudo useradd __-g__ `admin` _username_ |
* __usermod__: cambia la configuracion del usuario sobre un directorio o archivo
    | param | descripcion | ejemplo |
    |-|-|-|
    | __-aG__ |  Agrega un usuario a un grupo adicional | sudo usermod __-aG __sudo _username_ |
    | __-s__ |  Cambia el shell predeterminado del usuario | sudo usermod __-s__ `/bin/zsh` _username_ |
    | __-d__ |  Cambia el directorio home del usuario | sudo usermod __-d__ `/home/newdir` _username_ |
* __userdel__:  Elimina un usuario del sistema, pero conserva su home |
    | param | descripcion | ejemplo |
    |-|-|-|
    | __-r__ |  Elimina un usuario y su directorio home | sudo userdel __-r__ _username_ |
* __groupadd__:  Crea un nuevo grupo de usuarios
    | param | descripcion | ejemplo |
    |-|-|-|
    | __-g__ |  Crea un grupo especificando el GID (ID de grupo) | sudo groupadd __-g__ _1001_ `admin` |
* __groupmod__: modifica los permisos o la configuracion de un grupo
    | param | descripcion | ejemplo |
    |-|-|-|
    | __-n__ |  Cambia el nombre de un grupo | sudo groupmod __-n__ `oldName` `newName` |
    | __-g__ |  Cambia el GID de un grupo | sudo groupmod __-g__ _2001_ _groupname_ |
* __groupdel__:  Elimina un grupo del sistema | sudo groupdel _groupname_ |

## Gestion de Permisos

Una de las principales tareas de la gestión de usuarios y grupos es _configurar los permisos de archivos y directorios_, lo cual determina qué usuarios pueden __leer, escribir o ejecutar__ ciertos archivos.

| Opción | Descripción | Ejemplo |
|--|--|--|
| __chown__ | Cambia el propietario de un archivo o directorio | sudo __chown__ username:_groupname_ `file.txt` |
| __chmod__ | Cambia los permisos de un archivo o directorio | sudo __chmod__ _755_ `file.sh` |
| __chgrp__ | Cambia el grupo propietario de un archivo o directorio | sudo __chgrp__ _groupname_ `file.txt` |

## Configuracion

La configuracion de usuarios y grupos se puede gestionar a través de archivos que contienen la información respectiva sobre usuarios, contraseñas y grupos. Estos archivos son fundamentales para el correcto funcionamiento del sistema.

| Archivo | Descripción |
|--|--|
| __/etc/passwd__ | Contiene información básica sobre los usuarios del sistema |
| __/etc/shadow__ | Almacena las contraseñas de los usuarios de manera segura |
| __/etc/group__ | Define los grupos y sus miembros |

[volver](../readme.md)