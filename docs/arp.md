# ARP (Address Resolution Protocol)

Especificado en 1982 en el estándar __RFC 826__ para llevar a cabo la resolución de _direcciones IPv4_ en _direcciones MAC_. Es imprescindible para la transmisión de datos en redes Ethernet porque _las tramas solo pueden enviarse con ayuda de una dirección de hardware a los hosts de destino_, pero el _protocolo de Internet no puede obtener estas direcciones físicas_ por sí mismo.

## Memoria Cache ARP

Hace referencia a un __listado en forma de tabla de las direcciones MAC__ que se necesitan con mayor frecuencia, donde cada entrada es _generada por el protocolo de red o manualmente_. 

Las entradas estáticas están disponibles hasta que el dispositivo se apaga o se vuelve a encender y __la caché del ARP se borra por completo__.

Existe una _herramienta homónima_ para los diferentes sistemas operativos que puede mostrar la caché ARP y añadir o eliminar entradas manualmente.

| Parametro | Descripcion | Ejemplo |
|--|--|--|
|__-a__| Muestra las entradas almacenadas en cache | arp -a |
|__-d__| Elimina una entrada de la memoria cache | arp -d `192.168.0.1` |
|__-s__| Agrega una nueva entrada a la memoria cache | arp -s `192.168.0.1` `08:00:27:0f:c3:a4` |
|__-v__| Habilita el modo detallado y muestra un resumen | arp -v |
|__-n__| No resuelve los nombres de Host | arp -n |
|__-i__| Especifica la interfaz de red | arp -i `enp0s3` |
|__-D__| Muestra la direccion de hardware del dispositivo determinado | arp -D `192.168.0.1` |
|__-e__| Muestra los resultados en estilo predeterminado (Linux) | arp -e |
|__-H__| Especifica el tipo de hardware | arp -H `ether` |
|__-p__| Publicar la entrada | arp -s `192.168.0.1` `08:00:27:0f:c3:a4` -p |
|__-r__| Lee entradas del archivo o entrada estándar | arp -r < `arp_entries.txt` |
|__-t__| Especifica el tipo de hardware | arp -t `ether` -a |

## Vecinos IPv4

El comando `ip neighbor` manipula objetos vecinos que establecen __enlaces entre direcciones IP y direcciones MAC para hosts que comparten el mismo enlace__. Se organizan las entradas de vecinos en tablas. 

Los comandos correspondientes muestran __enlaces vecinos__ y sus propiedades, agregar nuevas entradas de vecinos y eliminar las antiguas.

| Comando | Descripcion |
|--|--|
| __show__ | Muestra las entradas almacenadas en cache |
| __add__ | Agrega una nueva entrada a la memoria cache |
| __replace__ | Agrega una nueva entrada o edita una existente |
| __delete__ | Elimina una entrada de la memoria cache |

## Estados Tabla ARP

Si una solicitud ARP llega a un __router con un Proxy ARP activado__, este responde en lugar del host de destino. Para ello _transmite su propia dirección MAC_, con lo que también recibe los paquetes de datos del remitente. Posteriormente, el router le transmite la información al host de destino con ayuda de los datos de la caché de ARP.

| Estado | Descripcion |
|--|--|
|__NOARP__ | La entrada es válida pero no se tratará de válidar y se puede borrar cuando su tiempo de vida expire |
|__PERMANENT__ | La entrada es válida permanentemente y se debe borrar explìcitamente |
|__REACHABLE__ | la entrada es válida hasta que se agote el tiempo de espera |
|__FAILED__ | No se pudo encontrar la mac address de la ip |
|__STALE__ | La dirección es válida, pero ha pasado un cierto tiempo en el que no ha obtenido respuesta |
|__DELAY__ | Similar a STALE, pero el kernel está esperando un determinado tiempo |
|__NONE__ | Estado ficticio que se usa al crear una entrada en la tabla o luego de intentar borrarla antes que se libere |
|__INCOMPLETE__ | La línea aun no ha sido validada o resuelta |
|__PROBE__ | Se está probando la mac address |