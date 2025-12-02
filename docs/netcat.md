# Netcat 

Herramienta de red que se utiliza para la __lectura y escritura en conexiones de red__. Puede ser utilizada para tareas como _transferencia de archivos, depuración de servicios de red, creación de servidores y clientes simples, y exploración de puertos, entre otros_.

* __Conexión a puertos remotos__: Permite conectarse a servidores remotos, para probar la conectividad o para interactuar con un servicio.
* __Transferencia de archivos__: Permite el intercambio de datos entre computadoras a través de la red.
* __Escucha de puertos__: Puede funcionar como un servidor esperando conexiones entrantes.
* __Pruebas de red__: Util para hacer pruebas de conectividad entre hosts, verificar la disponibilidad de un servicio en un puerto específico.
* __Redirección de puertos__: Puede establecer un túnel entre puertos locales y remotos.

## Protocolos

* __TCP__ (Transmission Control Protocol): Para comunicaciones orientadas a conexión, garantiza fiabilidad en la transmisión de datos.
* __UDP__ (User Datagram Protocol): Protocolo sin conexión que no garantiza la entrega de paquetes, pero es más rápido para ciertas aplicaciones.

| Parametro | Descripcion | Ejemplo |
|-|-|-|
| __-l__ | Escuchar un puerto en modo servidor | nc __-l__ `1234` |
| __-v__ | Modo "verbose", muestra detalles adicionales | nc __-v__ _example.com_ `80` |
| __-u__ | Modo de conexion UDP | nc __-u__ _example.com_ `1234` |
| __-z__ | Escaneo de puertos sin establecer conexion | nc __-zv__ _192.168.0.1_ `80-100` |
| __-w__ | Tiempo de espera, en segundos, para la conexión | nc __-w__ `5` _example.com_ `80` |
| __-p__ | Especifica un puerto local para la conexión cliente | nc -p `12345` _example.com_ `80` |
| __-e__ | Ejecuta un comando cuando se establece una conexión, útil para conexiones reversas | nc -l -p `1234` __-e__ `/bin/bash` |
| __-n__ | No realiza resolución de DNS | nc __-n__ _192.168.0.1_ `80` |
| __-k__ | Mantiene la conexión abierta tras una desconexión en modo servidor | nc __-lk__ `1234` |
| __-c__ | Ejecuta un comando al establecer una conexión, como un shell | nc -l `1234` __-c__ `'echo hello'` |

[volver](../readme.md)