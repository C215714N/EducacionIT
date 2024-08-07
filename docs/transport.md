## Transporte

Capa fundamental para garantizar una comunicación eficiente y confiable entre aplicaciones en diferentes sistemas. Divide los datos en segmentos más pequeños para su transmisión, especialmente útil cuando los datos superan el tamaño máximo de la unidad de transmisión de la red (MTU).

|Tipo | desde | hasta | Descripcion |
|-|-:|-:|--|
| Conocido | 0 | 1023 | Utilizado para servicios y protocolos estándar y bien establecidos. Estos puertos están asignados por la IANA. |
| Registrado | 1024 | 49151 | Reservado para aplicaciones específicas de red no estandarizadas oficialmente. Estas aplicaciones pueden solicitar estos puertos a la IANA.	 |
| Dinamico | 49152 | 65535 | Utilizados para conexiones temporales o efímeras. Suelen ser asignados dinámicamente por el sistema operativo para conexiones salientes.	 |


Podemos __visualizar y gestionar conexiones de red, tablas de enrutamiento, estadísticas de interfaces de red__ y más con las herramientas __netstat(Network Statistics)__ y __ss(Socket Services)__. Estos comandos se utilizan para diagnosticar problemas de red, _supervisar la actividad de red_ en un sistema, y saber qué servicios están en ejecución y en qué puertos están escuchando conexiones.

| Estado | Descripcion |
|-|-|
| OPEN | En este estado, la conexión está activa y los datos pueden fluir entre los sistemas |
| CLOSED | El puerto no está disponible para la comunicación hasta que se vuelva a abrir |
| LISTENING | Estado típico en servidores que esperan solicitudes de conexión en un puerto específico. |

[volver](../readme.md)