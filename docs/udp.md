# UDP (User Datagram Protocol)

Es un _protocolo de la capa de transporte_ del modelo TCP/IP, que opera sin conexión. A diferencia de TCP, __no garantiza la entrega confiable de los datagramas ni el orden en que llegan__, pero ofrece una comunicación más rápida y eficiente. Su primera especificación se publicó en el __RFC 768__ en 1980.

## Características Principales

UDP es un protocolo mínimo que carece de mecanismos de control de flujo, control de errores y confirmación de recepción. Esto lo hace ideal para aplicaciones donde la __velocidad es crítica__ y la _pérdida ocasional de datos es aceptable_.

*   __Orientado a datagramas__: La unidad de información es el datagrama.
*   __Sin conexión__: No requiere un establecimiento de conexión previo.
*   __No confiable__: No retransmite paquetes perdidos ni confirma su recepción.
*   __Baja latencia__: Al no tener sobrecarga de control, es más rápido.

## Aplicaciones de Red

UDP se utiliza comúnmente en aplicaciones donde se requiere una _transmisión de datos en tiempo real_ o donde la sobrecarga de TCP es prohibitiva.

Algunos ejemplos incluyen:

*   __Streaming multimedia__: Una pequeña pérdida de datos es preferible a un retraso notorio.
*   __Juegos online__: La velocidad de respuesta (baja latencia) es crucial.
*   __DNS__: Consultas rápidas de nombres de dominio.
*   __VoIP__: Comunicación de voz en tiempo real.
*   __DHCP__: Asignación de direcciones IP.

Podemos __visualizar y gestionar conexiones UDP__ con las mismas herramientas mencionadas para TCP, como __netstat(Network Statistics)__ y __ss(Socket Services)__, usando el parámetro específico para este protocolo.

| Parametro | Descripción |
|-|-| 
| __-u__ | Solamente solo conexiones UDP | 
| __-l__ | Muestra solo conexiones en escucha | 
| __-n__ | Muestra direcciones IP y números de puerto en formato numérico | 
| __-p__ | Muestra el nombre del proceso o id asociado a cada conexión | 
| __-a__ | Muestra todas las conexiones y sockets, incluyendo UDP | 
| __-r__ | Muestra la tabla de enrutamiento del sistema | 

[volver](../readme.md)