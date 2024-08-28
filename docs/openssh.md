## OpenSSH 

Conjunto de _herramientas de software_ que proporcionan _conectividad segura_ a través de una red no segura. Es ampliamente utilizado para acceder de forma segura a sistemas remotos y transferir archivos de manera segura.

Inicialmente desarrollado como parte del proyecto OpenBSD, OpenSSH se ha convertido en una solución de facto para la __administración remota segura__ y la __transferencia de archivos en red__ mediante el uso de __cifrado fuerte__.

### Características

* __Cifrado__: Utiliza algoritmos de cifrado robustos como AES y RSA para proteger la integridad y confidencialidad de los datos.
* __Autenticación__: Soporta múltiples métodos de autenticación, incluyendo _contraseñas, claves públicas, y autenticación basada en certificados_.
* __Túneles SSH__: Permite la creación de túneles seguros para redirigir tráfico a través de una conexión cifrada.
* __Compatibilidad__: Disponible en la mayoría de sistemas operativos, incluyendo Linux, BSD, macOS, y Windows.
* __Herramientas CLI__: Incluye herramientas de línea de comandos como `ssh`, `scp`, `sftp`, y `sshd` para la administración de sesiones y transferencias seguras.

### Implementación

* __Administración Remota__: Facilita la administración segura de servidores y dispositivos remotos a través de sesiones cifradas.
* __Transferencia de Archivos__: Permite transferir archivos de forma segura utilizando `scp` o `sftp`.
* __Túneles Seguros__: Crea túneles SSH para proteger aplicaciones y protocolos no seguros.
* __Port Forwarding__: Habilita el reenvío de puertos para acceder a servicios internos de manera segura.
* __Autenticación Basada en Claves__: Ofrece autenticación mediante claves públicas, proporcionando un acceso más seguro que las contraseñas.

### Configuración

OpenSSH se puede configurar editando los archivos de configuración, típicamente ubicados en:

* __Windows__: `C:\Program Files\OpenSSH\etc\sshd_config`
* __Linux__: `/etc/ssh/sshd_config` (servidor) y `~/.ssh/config` (cliente)

### Ejemplos

* __Configuración Básica de `sshd_config`__:
   ```ini
   Port 22                    # Puerto de escucha
   Protocol 2                 # Versión del protocolo SSH
   PermitRootLogin no         # Permitir inicio de sesión raíz
   PubkeyAuthentication yes   # Autenticación basada en claves
   ClientAliveInterval 300    # Tiempo máximo de inactividad
   ```
### Comandos

* __ssh ``user``@``host``__: Conexion a un servidor SSH remoto
* __sftp ``user``@``host``__: Inicia una sesión FTP segura
* __ssh -L `8080`:`host`:`80` `user`@`host`__: Configura un tunel ssh
* __ssh-keygen__: Genera un par de claves SSH
* __ssh-keygen -t `rsa` -b `4096` -C `user@host`__: Genera una clave RSA en `~/.ssh/id_rsa` y `~/.ssh/id_rsa.pub`.
* __ssh-copy-id `user@ip_address`__: Copia la clave pública al servidor en `~/.ssh/authorized_keys`
* __scp `file.txt` `user`@`remote`:`/path/`__: Copia un archivo a un servidor remoto
* __scp `user`@`remote`:`/path/` `file.txt`__: Copia un archivo a un servidor remoto
