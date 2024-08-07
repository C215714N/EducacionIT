
## Red

Capa cuya función principal es manejar el direccionamiento y enrutamiento de paquetes de datos entre diferentes redes. Es responsable de la entrega de paquetes desde el origen hasta el destino a través de una o más redes, gestionando la forma en que los datos se trasladan a través de la infraestructura de red.

### Rango Publico

| Clase | desde | hasta | Byte 1 ini | Byte 1 fin |
|-|-|-|-|-|
| A | __0__.0.0.0  | __127__.255.255.255 | **0**0000000 | **0**1111111 |
| B | __128__.0.0.0 | __191__.255.255.255 | **10**000000 | **10**111111 |
| C | __192__.0.0.0 | __223__.255.255.255 | **110**00000 | **110**11111 |
| D | __224__.0.0.0 | __239__.255.255.255 | **1110**0000 | **1110**1111 |
| E | __240__.0.0.0 | __255__.255.255.255 | **1111**0000 | **1111**1111 |

### Rango Privado

| Clase | desde | hasta | Byte 1 ini | Byte 1 fin |
|-|-|-|-|-|
| A | 10.0.0.0  | 10.255.255.255 | **0**0001010 | **0**0001010 |
| B | 172.16.0.0 | 172.31.255.255 | **10**101100 | **10**101100 |
| C | 192.168.0.0 | 192.168.255.255 | **110**00000 | **110**00000 |
| D | Multicast |
| E | Research | 

[volver](../readme.md)