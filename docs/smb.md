# SMB (Server Message Block) 

Es un __protocolo cliente-servidor__ que controla el _acceso a archivos y directorios_, así como a otros recursos de la red. También sirve como base para el intercambio de información entre los diferentes procesos de un sistema __(comunicación entre procesos)__. 

Aunque fue desarrollado ya en 1983 por el grupo de TI de IBM, en las últimas décadas se han publicado varias versiones e implementaciones del protocolo. Con el __proyecto de software libre Samba__ existe también una solución que permite el uso de Server Message Block en distribuciones _Linux y Unix_, así como la comunicación entre plataformas.

## Instalacion del servicio

* __Debian__
    ```bash
    sudo apt install samba # instalar el servicio
    sudo nano /etc/samba/smb.conf # archivo de configuracion
    sudo systemctl restart smbd # reiniciar el servicio
    ```
* __CentOS__
    ```bash
    sudo yum install samba # instalar el servicio
    sudo nano /etc/samba/smb.conf # archivo de configuracion
    sudo systemctl start smb # iniciar el servicio
    ```
* __Configuracion Basica__
    ```bash
    [shared_folder]
    path = /home/user/documents/shared_folder
    available = yes
    valid users = remoteUser
    read only = no
    browsable = yes
    public = yes
    ```

## Configuracion smbd

| Parámetro | Descripción |
|-|-|
| __workgroup__ | Define el grupo de trabajo de la red |
| __server string__ | Descripción del servidor Samba |
| __security__ | Establece el modo de seguridad |
| __map to guest__ | Define cómo manejar las conexiones de invitados |
| __guest account__ | Especifica la cuenta de usuario para invitados |
| __share name__ | Nombre del recurso compartido |
| __path__ | Ruta al directorio que se compartirá |
| __valid users__ | Usuarios válidos que pueden acceder al recurso |
| __read only__ | Define si el recurso es de solo lectura |
| __browsable__ | Si el recurso compartido es visible en la red |
| __create mask__ | Permisos por defecto para nuevos archivos |
| __directory mask__ | Permisos por defecto para nuevos directorios |
| __force user__ | Fuerza un usuario específico para todos los archivos |
| __public__ | Define si el recurso es público |
| __veto files__ | Archivos que no deben ser visibles en el recurso compartido |

## Herramienta CLI

| Comando | Descripcion |
|-|-|
| __smbd__ | servidor maneja las solicitudes de archivos |
| __nmbd__ | servidor que proporciona servicios de nombre NetBIOS |
| __smbclient__ | cliente para acceder a recursos compartidos |
| __testparm__ | verifica la configuración de Samba en `smb.conf` |
| __smbstatus__ | información sobre conexiones activas y archivos abiertos |
| __smbpasswd__ | cambia la contraseña de un usuario Samba |
| __smbtree__ | representación jerárquica de los recursos compartidos |
| __smbcontrol__ | envia señales a los procesos de Samba |
| __smbmount__ | monta un recurso compartido en un directorio local |
| __smbumount__ | desmonta un recurso compartido montado |
| __smbcquotas__ | muestra y gestiona las cuotas de los recursos compartidos |
| __smbcifs__ | herramienta para montar recursos compartidos usando CIFS |

[volver](../readme.md)