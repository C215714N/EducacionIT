# SSH (Secure Shell)

Nombre de un __protocolo y programa__ que lo implementa cuya principal función es el __acceso remoto a un servidor__ por medio de un canal seguro en el que toda la _información está cifrada_. 

Tambien permite _copiar datos de forma segura, gestionar claves RSA para no escribir contraseñas_ al conectar a los dispositivos y pasar los datos de cualquier otra aplicación por un canal seguro tunelizado mediante SSH y también puede _redirigir el tráfico_ para poder ejecutar programas gráficos remotamente. El puerto TCP asignado es el 22.

| Parametro | Descripcion |
|-|-|
| __-i__| Permite especificar el archivo de clave privada para la autenticación |
| __-f__| Envía el comando SSH al fondo, útil cuando se ejecuta un túnel o comando en segundo plano |
| __-l__| Define el nombre de usuario con el que se va a autenticar |
| __-o__| Permite establecer opciones específicas del protocolo SSH como `StrictHostKeyChecking` |
| __-p__| Especifica el puerto al que se conecta el cliente SSH (Por defecto 22) |
| __-q__| Suprime la salida de la conexión SSH, útil para scripts o automatización |
| __-v__| Habilita el modo detallado (verbose), mostrando información adicional sobre la conexión |
| __-A__| Reenvío del agente SSH, permite usar claves privadas en el servidor remoto |
| __-C__| Compresión de la sesión SSH, puede mejorar el rendimiento en conexiones lentas |
| __-L__| Establece un túnel de puerto local (forwarding). Permite redirigir puertos locales a un servidor remoto. |
| __-N__| No ejecuta comandos remotos, solo establece la conexión SSH. Útil para túneles SSH |
| __-R__| Establece un túnel de puerto remoto (reverse forwarding). Permite redirigir puertos remotos a la máquina local |
| __-T__| Evita la asignación de un terminal en la conexión SSH |
| __-X__| Habilita el reenvío X11 para ejecutar aplicaciones gráficas remotamente |
| __-Y__| Activa el reenvío de X11 de confianza. Similar a `-X`, pero sin restricciones de seguridad |

__Herramientas OpenSSH__

| Comando | Descripción |
|--|--|
| __ssh__ | Conectar a un servidor remoto a través de SSH |
| __scp__ | Copiar archivos de forma segura entre hosts |
| __sftp__ | Acceder y transferir archivos de forma segura a través de SFTP |
| __ssh-keygen__ | Generar pares de claves SSH pública y privada |
| __ssh-copy-id__ | Copiar la clave pública al servidor remoto para autenticación sin contraseña |
| __ssh-add__ | Agregar claves privadas SSH al agente de autenticación |
| __ssh-agent__ | Administrar un agente de autenticación para manejar las claves privadas SSH |
| __ssh-keyscan__ | Recopilar claves públicas de un servidor remoto para evitar advertencias de seguridad |
| __sshfs__ | Montar un sistema de archivos remoto a través de SSH |
| __sshd__ | Iniciar o reiniciar el demonio de servidor SSH en el host remoto |

[volver](../readme.md)