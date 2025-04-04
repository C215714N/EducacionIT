## Seguridad Informática

La seguridad informática abarca las prácticas, herramientas y procesos para proteger sistemas, redes y datos de accesos no autorizados, alteraciones y destrucción. Se basa en tres pilares fundamentales:

| Caracteristicas | Descripcion | Ejemplo |
|-|-|-|
| __Confidencialidad__ | Protección de datos contra accesos no autorizados. | Uso de protocolos cifrados como HTTPS y VPN para proteger la información sensible en tránsito |
| __Integridad__ | Garantizar que los datos no sean alterados de manera indebida. | Utilizar firmas digitales y algoritmos de hashing como SHA*256 para verificar la autenticidad y la integridad de los datos |
| __Disponibilidad__ | Asegurar que los datos y servicios estén disponibles cuando se necesiten | Implementar sistemas de respaldo y estrategias de alta disponibilidad (HA) para evitar interrupciones del servicio |

### Amenazas y Riesgos Comunes

Las amenazas son intentos maliciosos de comprometer la seguridad de un sistema o red. A continuación, se detallan algunas de las más comunes:

* __Malware__: Software malicioso que puede dañar dispositivos, robar datos o espiar a los usuarios.  
  Ejemplos:  
  * _Virus_: Infecta archivos ejecutables para propagarse.  
  * _Gusanos_: Se replica automáticamente a través de redes.  
  * _Troyanos_: Se presentan como software legítimo para ejecutar acciones maliciosas.  
  * _Ransomware_: Bloquea el acceso a datos hasta que se paga un rescate.

* __Phishing__: Intento de obtener información confidencial engañando a las personas para que revelen datos personales.  
  * _Métodos_: Correos electrónicos falsos, mensajes SMS (smishing), o llamadas telefónicas (vishing).  
  * _Contramedidas_: Utilizar filtros de correo electrónico, autenticación de dos factores (2FA) y capacitación en ciberseguridad para empleados.

* __Ataques DDoS__: Consiste en agotar los recursos de una red o servidor mediante múltiples solicitudes simultáneas.  
  * _Objetivo_: Interrumpir el servicio legítimo para los usuarios.  
  * _Mitigación_: Implementar soluciones como _WAFs_ (firewalls de aplicaciones web) y servicios de protección DDoS como Cloudflare o Akamai.

* __Sniffing__: Interceptación de datos transmitidos por la red, utilizando herramientas como _Wireshark_ o _tcpdump_.  
  * _Riesgos_: Exposición de credenciales, correos electrónicos o datos sensibles.  
  * _Prevención_: Cifrado de tráfico con SSL/TLS y uso de VPN para proteger la información.

* __Spoofing__: Suplantación de identidad de una máquina o usuario para engañar a la red.  
  * __Tipos comunes__:  
    * _IP Spoofing_: Alteración de la dirección IP para desviar o interceptar tráfico.  
    * _DNS Spoofing_: Redirección de usuarios hacia sitios maliciosos al manipular registros DNS.  
  * __Contramedidas__:  
    * Configuración de DNSSEC para garantizar la autenticidad de los registros DNS.  
    * Monitoreo de tráfico de red para identificar anomalías.

### Medidas de Mitigación

* __Cifrado__: Utilizar cifrado extremo a extremo para proteger los datos en tránsito. Almacenar contraseñas utilizando algoritmos de hashing seguros (p. ej., bcrypt o Argon2).
* __Capacitación en Ciberseguridad__: Realizar simulaciones de ataques como phishing para educar a los usuarios. Fomentar el uso de contraseñas fuertes y políticas de rotación periódica.
* __Seguridad de Red__: Configurar firewalls para restringir el acceso no autorizado. Desactivar servicios innecesarios para minimizar la superficie de ataque.
* __Seguridad Física__: Proteger los servidores y dispositivos en ubicaciones seguras con acceso restringido. Implementar vigilancia y sistemas de control de acceso físico.
* __Auditorías y Monitoreo__: Realizar análisis de vulnerabilidades periódicos con herramientas como Nessus o OpenVAS. Configurar sistemas de detección y prevención de intrusos (IDS/IPS).
* __Parcheo Regular__: Mantener el software, sistemas operativos y aplicaciones actualizados para corregir vulnerabilidades conocidas.

### Buenas Prácticas

* Mantener un sistema de respaldo automatizado y regular.  
* Implementar la segmentación de red para limitar la propagación de incidentes.  
* Activar la autenticación multifactor en todas las cuentas críticas.  
* Establecer políticas de acceso basado en el principio de privilegio mínimo.

## Sugerencias

La seguridad informática requiere múltiples capas de protección, desde la configuración de firewalls hasta el monitoreo constante.

1. **Mantener sistemas actualizados:**
   Usa herramientas como **Nessus** para detectar vulnerabilidades.
2. **Auditorías en Linux:**
    ```sh
    auditctl -w /etc/passwd -p wa -k passwd_changes
    ```
3. **Segmentación de red con VLANs y DMZ.**
4. **Reglas de Firewall en Linux:**
    ```sh
    # Bloquear tráfico ICMP
    iptables -A INPUT -p icmp -j DROP
    ```
5. **Cifrado en Apache con SSL/TLS:**
    ```sh
    a2enmod ssl
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
    ```

[volver](../readme.md)