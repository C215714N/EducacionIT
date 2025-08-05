# FTP (File Transfer Protocol)

El __protocolo de transferencia de archivos__ es una de las soluciones más populares para la _carga y descarga de archivos_. En este artículo te ofrecemos información sobre cómo instalar y configurar tu propio servidor FTP en Ubuntu y sobre los aspectos que se deben tener en cuenta para ello.

sigue estos pasos: 
1. Instala vsftpd: Utiliza el administrador de paquetes de tu distribución (como apt para Debian/Ubuntu o yum para CentOS/RHEL) para instalar el paquete vsftpd. 
2. Configura vsftpd: Edita el archivo de configuración principal, generalmente ubicado en /etc/vsftpd.conf, para ajustar parámetros como usuarios permitidos, directorio raíz, permisos, etc. 
3. Inicia y habilita el servicio: Asegúrate de que el servicio vsftpd se inicie automáticamente al arrancar el sistema y verifica su estado para confirmar que está funcionando correctamente. 

## Instalacion del servicio

* __Debian__:
    ```sh
    sudo apt install vsftpd     # instalar el servicio
    sudo nano /etc/vsftpd       # archivo de configuracion
    sudo systemctl start vsftpd # iniciar el servicio
    ```
* __CentOS__: 
    ```sh
    sudo yum install vsftpd     # instalar el servicio
    sudo nano /etc/vsftpd       # archivo de configuracion
    sudo systemctl start vsftpd # iniciar el servicio
    ```
* __Configuracion Basica__:
    ```yaml
    anonymous_enable = NO
    local_enable = YES
    write_enable = YES
    local_umask = 022
    chroot_local_user = YES
    ```

## Configuracion del servicio

| Parametro | Descripcion
|- |- |- |
| __anonymous_enable__ | Permite el acceso anónimo al servidor |
| __local_enable__ | Permite el acceso a usuarios locales del sistema |
| __write_enable__ | Permite la escritura en el servidor |
| __local_umask__ | Mascara de permisos para nuevos archivos y directorios |
| __chroot_local_user__ | Restringe a los usuarios a su directorio de inicio |
| __userlist_enable__ | Habilita la lista de usuarios permitidos |
| __userlist_file__ | Especifica el archivo con la lista de usuarios _/etc/vsftpd.userlist_ |
| __listen__ | Habilita el modo standalone escuchando una IP específica |
| __listen_ipv6__ | Habilita la escucha en IPv6 |
| __download_enable__ | habilita las descargas en el servidor |
| __ssl_enable__ | Habilita el cifrado SSL para el acceso FTP |
| __force_anon_logins_ssl__ | Los usuarios anónimos deben utilizar una conexión SSL |
| __force_local_logins_ssl__ | Obliga a los usuarios locales a usar una conexión SSL |
| __anon_max_rate__ | Capacidad máxima de transferencia Bps para usuarios anónimos |
| __local_max_rate__ | Capacidad máxima de transferencia Bps para usuarios locales |
| __max_clients__ | Cantidad de clientes que pueden conectarse simultáneamente |
| __max_per_ip__ | Maximo de conexiones permitidas por dirección IP |
| __anon_root__ | Directorio predeterminado para usuarios anónimos _/home/ftp_ |

[volver](../readme.md)