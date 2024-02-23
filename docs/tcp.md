# TCP (Transport Control Protocol)

Es un _acuerdo estandarizado_ de __transmisión de datos entre los hosts de una red informática__. En 1973 _Robert Kahn y Vinton Cerf_ publicaron su primera versión, pero pasaron ocho años para que se estandarizara con el __RFC 793__ y aunque el núcleo del producto se mantiene sin cambios, la versión actual publicada en el __RFC 7323__ es del 2014.

## Conexiones de Red

Podemos __visualizar y gestionar conexiones de red, tablas de enrutamiento, estadísticas de interfaces de red__ y más con las herramientas __netstat(Network Statistics)__ y __ss(Socket Services)__. Estos comandos se utilizan para diagnosticar problemas de red, _supervisar la actividad de red_ en un sistema, y saber qué servicios están en ejecución y en qué puertos están escuchando conexiones.

| Parametro | Descripcion |
|--|--|
| -t | Solamente conexiones TCP |
| -u | Solamente solo conexiones UDP |
| -l | Muestra solo conexiones en escucha |
| -n | Muestra direcciones IP y números de puerto en formato numérico |
| -p | Muestra el nombre del proceso o id asociado a cada conexion |
| -a | Muestra todas las conexiones y sockets |
| -r | Muestra la tabla de enrutamiento del sistema |

## Three-Way Handshake

Mediante _6 posibles bits individuales_ en el campo __Flags__ del segmento TCP, se pueden activar distintas acciones para _organizar la comunicación y el procesamiento de datos_.

Para establecer una conexión válida los hosts deben tener una __dirección logica (IPv4 o IPv6)__ y declarar el _puerto para la transmisión de datos_. Mientras que la IP funciona como identificador, el puerto sirve para que el sistema operativo pueda __asignar las conexiones a las aplicaciones de servidor y de cliente__.

| Flags | Descripcion |
|--|--|
|__URG__| Señaliza a la aplicación TCP que los datos de uso hasta el Urgent-Pointer fijado se deben procesar inmediatamente |
|__ACK__|Junto con el número de confirmación, ACK sirve para confirmar la recepción de paquetes TCP |
|__PSH__|Sirve para facilitar un segmento TCP inmediatamente sin tener que pasar por el buffer de datos del emisor y el receptor |
|__RST__| Si ha surgido un error durante la transmisión, la aplicación se puede restablecer mediante este paquete TCP |
|__SYN__| Representa el primer paso del __Three-Way Handshake__ para iniciar el establecimiento de conexión |
|__FIN__| Señaliza a la contraparte que uno de los interlocutores de la comunicación ha finalizado la transmisión |

Si el __emisor no recibe confirmación__ para uno de los segmentos enviados, se usa el denominado __Retransmission Timeout (RTO)__. Si se agota esta cuenta regresiva tras el envío de un paquete antes de que se transmita respuesta alguna, se _inicia automáticamente un nuevo envío_.

Ambos interlocutores pueden __interrumpir una conexión__ establecida e incluso _se permite la interrupción unilateral_. Este último caso también se denomina como __conexión semicerrada__, en la que _la contraparte todavía puede transmitir datos_ cuando un participante ya ha interrumpido la conexión.

## Puertos de Red

Es un __número de identificación de 16 bits__ que se utiliza para dirigir el __tráfico de red entrante y saliente__ a un proceso específico en una dispositivo de red. 

Los puertos se utilizan en conjunto con direcciones IP para permitir que _múltiples servicios y aplicaciones se ejecuten_ en un solo dispositivo de red. Para determinar el estado de los mismos, podemos existen tres términos que varían en función de la configuración.

| Estado | Descripcion |
|--|--|
| __Cerrados__ | Cuando la comunicación es rechazada completamente, por lo cual no generan tráfico |
| __Filtrados__ | El tráfico que transcurre por estos, es filtrado por aplicaciones de seguridad como firewall |
| __Abiertos__ | Cuando un servicio está escuchando en este puertos, y es accesible desde el exterior |

## Sockets de Internet  

Es una __interfaz de programación de aplicaciones (API)__ que proporciona un _mecanismo para que los programas de computadora se comuniquen a través de una red_ utilizando los protocolos como TCP y/o UDP. Se utilizan para establecer conexiones entre procesos que se ejecutan en diferentes dispositivos, permitiendo la transferencia de datos.

|Estado|Descripcion|
|--|--|
| __LISTEN__ | Esperando para atender peticiones |
| __ESTABLISHED__ | Conexion establecida |
| __SYN_SENT__ | Se esta intentando establecer una conexión |
| __SYN_RECV__ | Se recibió una petición para establecer una conexión |
| __FIN_WAIT1__ | Socket cerrado y cerrando la conexión |
| __FIN_WAIT2__ | Socket cerrado y esperando a que el host remoto cierre la conexión |
| __TIME_WAIT__ | El socket está cerrado pero espera por si hay paquetes en la red |
| __CLOSE__ | No se está usando el socket |
| __CLOSE_WAIT__ | El host remoto cerró la conexión y se espera a que se cierre el socket |
| __LAST_ACK__ | Esperando a que el host remoto acuse recibo que se desea cerrar la conexión |
| __CLOSING__ | Los dos sockets están cerrados pero no se terminó de enviar todos los datos |
| __UNKNOWN__ | Estado de conexion Desconocido |

[volver](../readme.md)