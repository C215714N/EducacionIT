## Operacion AND

Para poder establecer una comunicacion, los Hosts deben poseer una direccion IP y una mascara que determine a que red a la que pertenece el dispositivo.

|host data|byte1|byte2|byte3|byte4|
|----|-----|-----|-----|-----|
|__ip address__|192|168|0|56|
|__subnet mask__|255|255|255|0|
|__network__|192|168|0|0|
|__broadcast__|192|168|0|0|

Cuando se envian datos a otros hosts, si la direccion de destino se encuentra en la __misma Red__, la direccion MAC de destino sera la del __dispositivo receptor__; en cambio, si se encuentra en __otra red__, utilizara como destino la __direccion MAC de la puerta de enlace__.

Esto se puede determinar realizando la __operacion AND__ que consiste en la __comparacion de los bits__ de la _direccion IP de Destino_ con la _mascara de subred_ del dispositivo, lo cual da como resultado la __direccion de red__. Si dicho resultado concide con la IP Local corresponde a la misma subred, caso contrario, corresponde a una red remota.

|128|64|32|16|8|4|2|1|Dec| Hex|
|---|--|--|--|-|-|-|-|---|----|
| __1__ | __1__| 0| __1__|__1__|__1__|0|0|220|0xDC|
| __1__ | __1__| __1__| __1__|__1__|__1__|__1__|__1__|255|0xFF|
| __1__ | __1__| 0| __1__|__1__|__1__|0|0|220|0xDC|

De esta manera, cuando un router recibe un paquete IP debe determinar la red a la que pertenece la direccion de destino, para ello compara los bits de la direccion con las mascaras de cada red coincidente para determinar lo que se considera como mejor ruta.


|128|64|32|16|8|4|2|1|Dec| Hex|
|---|--|--|--|-|-|-|-|---|----|
| __1__ | __1__| 0| __1__|__1__|__1__|0|0|220|0xDC|
| __1__ | __1__| __1__| 0|0|0|0|0|224|0xE0|
| __1__ | __1__| 0| 0|0|0|0|0|192|0xC0|

Por ejemplo, si un router recibe un paquete IP con la direccion de destino __10.54.12.48__ y lo comparamos con las siguientes direcciones de red, podemos determinar que la mejor coincidencia seria la red __10.54.12.32/27__ ya que al realizar la operacion AND tenemos una coincidencia de 27 bits.

| network | cidr | next hop | hosts |
|---------|------|----------|-------|
| 10.54.12.0 | 25 | 32.43.15.12 | 126 |
| 10.54.12.0 | 26 | 32.43.15.13 | 62 |
| 10.54.12.0 | 27 | 32.43.15.14 | 30 |
| 10.54.12.32 | 27 | 32.43.15.11 | 30 |
| 10.54.12.64 | 26 | 32.43.15.13 | 126 |
| 10.54.12.128 | 26 | 32.43.15.14 | 63 |

Por otro lado, Si la direccion de destino fuese __10.54.12.145__
la mejor coincidencia seria la red __10.54.12.128/26__ ya que corresponden los primeros 26 bits, mientras que en los casos donde la mascara es mayor, algunos bits difieren.
