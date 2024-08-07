## Enlace de Datos

Esta capa es fundamental para la comunicación dentro de una red local y se encarga de proporcionar un enlace confiable y libre de errores entre dos dispositivos en la misma red física o en el mismo segmento de red. Los datos se encapsulan en tramas (frames) en esta capa. La información se envuelve en una trama que incluye la dirección MAC de origen y destino, y otros datos necesarios para la transmisión.

| subcapa | descripcion |
|-|-|
| __LLC (Logical Link Control)__ | Maneja la comunicación entre la capa de red (Capa 3) y la capa de enlace de datos (Capa 2). Incluye la identificación de protocolos y la multiplexión de servicios |
| __MAC (Media Access Control)__ | Gestiona cómo los dispositivos acceden al medio físico y transmite datos en una red local. Maneja la dirección MAC, el control de acceso al medio y la detección de errores |

[volver](../readme.md)