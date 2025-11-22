# ICMP (Internet Control Message Protocol)

Aspectos como la creación, la funcionalidad y la organización dentro de la amplia gama de protocolos de Internet se especificaron en 1981 en la RFC 792. En el caso de la sexta versión del Internet Protocol (IP), la implementación específica ICMPv6 fue definida en la RFC 4443. 

Es un __protocolo autónomo__ aun cuando los diferentes mensajes están incluidos en _paquetes IP tradicionales_. Para tal fin, el protocolo de Internet trata a la implementación opcional como un protocolo de capas superiores. Los diversos servicios de red que se suelen utilizar hoy en día, como __traceroute__ o __ping__, se basan en el protocolo ICMP.

## Tipos de mensajes

Debido a la longitud del campo de 8 bits, en teoría son posibles 256 tipos de mensajes ICMP diferentes, de los que se asignan alrededor de 40 (incluidos algunos representantes ya obsoletos) y algunos están bloqueados para el uso meramente experimental. No se asignan, sin embargo, gran parte de los números (42-252), sino que en principio solo se reservan. La asignación de los números es responsabilidad de la IANA (Internet Assigned Numbers Authority), que también regula la clasificación de los espacios para las direcciones IP y para los puertos. En la siguiente tabla aparece una recopilación de los tipos de paquetes más importantes basados en el Internet Control Message Protocol:

| Estado | Tipo | Descripción |
|-|-|-|
| __Echo Reply__ | 0 | Respuesta a un ping de red para comprobar la accesibilidad |
| __Destination Unreachable__ | 3 | Informa problemas de enrutamiento o bloqueo por parte de los cortafuegos |
| __Redirect Message__ | 5 | Redireccionamiento de un paquete para la red (0), el host (1), el servicio y la red (2) o el servicio y host (3) |
| __Echo Request__ | 8 | Ping de red |
| __Router Advertisement__ | 9 | Lo utilizan los routers para informarse acerca de los diferentes clientes de red |
| __Time Exceeded__ | 11 | Informe de estado, tiempo de vida (0) o el tiempo de espera (1) agotado |
| __Timestamp__ | 13 | Marca de tiempo del momento de envío, util para la sincronización de dos ordenadores |
| __Timestamp Reply__ | 14 | Respuesta a una petición de marca de tiempo enviado por el destinatario tras su recepción |
| __Traceroute__ | 30 | Se utilizaba para el seguimiento de la ruta de un paquete de datos en la red. Hoy en día se utilizan “Echo Request” y “Echo Reply” para estos fines |

## Linea de comandos

Para intercambiar datos de estado o mensajes de error, los nodos recurren al protocolo __Internet Control Message Protocol (ICMP)__ en las redes __TCP/IP__. Concretamente, los servidores de aplicaciones y las puertas de acceso como los routers, utilizan esta implementación del protocolo IP para devolver mensajes sobre problemas con datagramas al remitente del paquete.

* __ping__: Permite verificar conectividad y latencia, es util para saber si un host está activo
    | Parametro | Descripcion |
    |-|-|
    | __-c__ | Número de paquetes a enviar |
    | __-i__ | Intervalo entre paquetes en segundos |
    | __-t__ | Establece el valor de Time To Live en los paquetes |
    | __-s__ | Especifica el tamaño de los paquetes en bytes |
    | __-q__ | Salida silenciosa, muestra solo el resumen al final |
    | __-D__ | Imprime marca de tiempo (timestamp) junto a cada línea de salida |
    | __-W__ | Tiempo de espera (timeout) para respuestas en segundos |
    | __-4__ | Fuerza el uso de IPv4 |
    | __-6__ | Fuerza el uso de IPv6 |
    | __-f__ | Modo ráfaga (flood), envía paquetes lo más rápido posible |
* __traceroute__: Permite identificar la ruta y posibles cuellos de botella, ideal para diagnosticar problemas de red complejos
    | Parametro | Descripcion |
    |-|-|
    | __-n__ | No resuelve nombres de host (muestra solo direcciones IP) |
    | __-m__ | Número máximo de saltos (TTL). Predeterminado: 30 |
    | __-p__| Puerto de destino para traceroute (en protocolos UDP o TCP) |
    | __-w__ | Tiempo de espera por respuesta en segundos. Predeterminado: 5 |
    | __-q__ | Número de consultas por salto. Predeterminado: 3|
    | __-I__ | Usa ICMP en lugar de UDP (requiere privilegios de superusuario) |
    | __-T__ | Usa TCP SYN para las pruebas de rastreo (alternativa a ICMP o UDP)|
    | __-4__ | Fuerza el uso de IPv4 |
    | __-6__ | Fuerza el uso de IPv6 |
    | __-f__ | TTL inicial (número de saltos desde donde comienza el rastreo) |

[volver](../readme.md)