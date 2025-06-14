# HTTP (HyperText Transfer Protocol)

Es uno de los conceptos desarrollados por __Tim Berners-Lee__ y que forman la base de la _World Wide Web_, los otros son _HTML(Hypertext Markup Language)_ que define la estructura de las páginas web y _URI(Uniform Resource Identifier)_ que define cómo se localiza un recurso en Internet; mientras que el protocolo HTTP regula cómo el servidor envía este recurso al cliente.

## Versiones

__HTTP/1__: La versión inicial de HTTP fue bautizada en 1989 con el número de versión 0.9, consistía en una sola línea y solo permitía solicitar un archivo HTML del servidor cada vez. El servidor entonces no hacía más que transferir el archivo solicitado, de manera que esta versión del protocolo solo podía manejar archivos HTML.
	
* __Efimero__: el cliente establece una conexión con el servidor, envía su solicitud y el servidor responde: una vez lo ha hecho, la conexión se termina.
* __stateless__: Cuando el cliente vuelve a establecer contacto con el servidor, este no recuerda que dicho cliente ya le ha enviado solicitudes antes.
* __Independiente__: HTTP permite transferir todo tipo de archivos, siempre y cuando ambas partes sepan cómo manejar el tipo en cuestión.

---
__HTTP/1.1__ Publicado en 1997 y descrito en el __RFC 2068__, es considerado el primer estándar oficial. Esta versión se sigue usando hoy en día y presenta cambios importantes respecto a HTTP/1

* __Keepalive__: el cliente puede mantener la conexión más allá de la solicitud (persistent connection) añadiendo al header la opcion mantener con vida.
* __pipelining__: Tecnica que permite al cliente enviar la siguiente solicitud sin tener que esperar a recibir la respuesta de la primera.
* __Cache__: existen nuevos mecanismos para guardar contenido temporalmente.
* __Host__: La especificación en el header permite que la solicitud funcione también si hay varios dominios alojados en la misma IP (shared hosting).

---
__HTTP/2__ Con el paso del tiempo, las páginas web se volvían cada vez más amplias y complejas. Google desarrolló un nuevo y experimental protocolo, el SPDY o Speedy, que despertó un gran interés entre los desarrolladores y permitió que en 2015 se publicara la versión HTTP/2 del protocolo. 

* __Datos__: El protocolo trabaja con datos binarios en lugar de archivos de texto.
* __Multiplex__: El cliente y el servidor pueden enviar y procesar varias solicitudes simultáneamente.
* __Compresion__: Los headers pueden ser idénticos en muchas solicitudes HTTP y esto evita las redundancias.
* __Server Push__: Cuando el servidor prevé qué datos solicitados, los envía directamente a la caché del cliente, sin esperar la solicitud.

---
__HTTP/3__ El problema con las versiones anteriores radica en el uso del protocolo TCP, ya que requiere que el receptor confirme la recepción antes de que pueda enviar el siguiente paquete. Estos casos son llamados head-of-line blocking.

* __QUIC__: Permite protocolos de enlace criptográficos y de transporte más rápidos, reduciendo la latencia y el tiempo de establecimiento de la conexión
* __TLS__: QUIC cifra todos los datos, incluidos los encabezados, lo que proporciona una capa adicional de seguridad
* __Fluidez__: Reduciendo la latencia y el tiempo de establecimiento de la conexión. 


## HTTP Secure

Al principio, todo el tráfico de datos de Internet se gestionaba abiertamente, en __texto plano__. El protocolo HTTP media la __comunicación entre el cliente (navegador) y el servidor web sin cifrar__, lo que facilita las actividades criminales, como el _espionaje de metadatos o los ataques man-in-the-middle_.

El __protocolo HTTPS__ se desarrolló para que la navegación web sea más segura. El _servidor web se autentica enviando un certificado_ al navegador justo al comienzo de la transmisión de datos, que garantiza la __fiabilidad del dominio__. Esta medida _ayuda a combatir el fraude_ por parte de páginas web falsas.

## Diferencias

HTTPS utiliza un protocolo de transmisión denominado __SSL/TLS__. No es el protocolo en sí el que ofrece más seguridad, sino el _tipo de transferencia_. El protocolo HTTP solo regula cómo debe estructurarse el contenido que el navegador y el servidor web intercambian. 

|Caracteristica| HTTP | HTTPS |
|-|-|-|
| Transmicion | texto plano | Cifrada |
| Certificado | No |	Sí |
| Puerto | 80 | 443 |
| URL | http:// | https:// |

El protocolo de transferencia, indica cómo se transfieren los flujos de datos entre dispositivos, asegurando que no se pierdan paquetes de datos. Cuando un URL empieza con https://, el navegador añade automáticamente el número de puerto 443, indica al receptor que debe comunicarse a través de TLS/SSL.

## Certificado SSL

__Secure Sockets Layer__ hace referencia al protocolo de cifrado en la pila de protocolos TCP/IP. Un certificado SSL actúa como __prueba de identidad vinculante__ y suele contener información con la que el navegador y el servidor pueden elaborar el cifrado. Sin embargo, en lugar de SSL, hoy en día los certificados se basan por defecto en el sucesor __TLS (Transport Layer Security)__, aunque se siga utilizando el nombre antiguo.

Si se pretende es proteger una página web para que se acceda a ella con HTTPS, se puede recurrir tanto a un certificado gratuito como uno de pago, ambos implementan TLS y garantizan la transferencia de datos segura para los clientes y los servidores. Existen puntos que diferencian de manera determinante a los certificados gratuitos de los de pago:

* __Grado de validación__: En la emisión de un certificado, la verificación del operador del sitio web no es muy extensa. La validación de dominio es el nivel de control habitual. Los certificados con un nivel de seguridad mayor están sujetos a pago.
* __Validez__: La mayor parte de los certificados de pago tienen una validez de entre uno y dos años. Los gratuitos caducan en un máximo de 90 días. Es decir, quien opte por un certificado SSL/TLS gratuito, tendrá que cambiarlo con mayor frecuencia.
* __Dominio de Pertenencia__: un certificado SSL gratuito se vincula siempre a un único dominio. Las soluciones SSL/TLS de pago generan certificados que se puedan usar para diferentes sitios web.

[volver](../readme.md)