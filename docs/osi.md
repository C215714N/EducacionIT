# Modelo OSI (Open Systems Interconnected)

Es un marco teórico que describe cómo los sistemas de comunicación en redes deben interaccionar y comunicarse en una red de datos, fue desarrollado por la Organización Internacional de Normalización (ISO) y es útil para entender y diseñar redes de computadoras. El modelo OSI está compuesto por siete capas, cada una con responsabilidades específicas.


| Capa | PDU | Protocolos | Descripcion |
|-|-|-|-|
| capa 7: APLICACION  | Datos | HTTP, HTTPS, FTP, SFTP, TFTP, SSH, TELNET, POP, IMAP, SMTP, DHCP, DNS | Interacción con el software de red |
| capa 6: PRESENTACION | Datos | SSL/TLS, JPEG, GIF, ASCII | Traducción y cifrado de datos |
| capa 5: SESION | Datos | NetBIOS, PPTP, RPC | Gestión de sesiones de comunicación |
| capa 4: [TRANSPORTE](./transport.md) | Segmento (Datagrama) | TCP, UDP, SCTP | Segmentación y entrega de datos |
| capa 3: [RED](./network.md) | Paquete | IPv4, IPv6, ICMP, OSPF, EIGRP | Enrutamiento y direccionamiento de paquetes |
| capa 2: ENLACE DE DATOS | Trama (Frame) | ARP, Ethernet, PPP, HDLC, Frame-Relay, Wi-Fi(IEEE 802.11) | Encapsulamiento en tramas y control de errores |
| capa 1: FISICA | Bits | 10GBase-TX, 1000Base-T, 100Base-CX, 10GBase-LR | Transmisión de bits a través del medio físico |

[volver](../readme.md)