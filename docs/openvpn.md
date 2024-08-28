## OpenVPN 

Solución de _código abierto_ que permite la creación de __redes privadas virtuales (VPN)__. Ofrece un _alto nivel de seguridad_ y es ampliamente utilizado para _proteger comunicaciones en entornos inseguros_, como internet.

Fue diseñado para ser compatible con una variedad de configuraciones, desde conexiones de sitio a sitio hasta configuraciones cliente-servidor, utilizando técnicas de _cifrado robusto_ y _autenticación_.

### Características

* __Cifrado__: Utiliza algoritmos avanzados como AES y HMAC-SHA para garantizar la privacidad y seguridad de los datos.
* __Autenticación__: Soporta autenticación mediante _certificados digitales, nombres de usuario y contraseñas_, o autenticación de dos factores.
* __Multiplataforma__: Compatible con múltiples sistemas operativos como Windows, macOS, Linux, Android, e iOS.
* __Túneles Seguros__: Crea túneles cifrados que encapsulan el tráfico de red, protegiendo la privacidad del usuario.
* __Flexibilidad__: Puede ser configurado en una variedad de topologías, como _cliente-servidor, sitio a sitio, y punto a punto_.

### Implementación

* __Conexiones Seguras__: Protege las conexiones entre el cliente y el servidor, asegurando que los datos transmitidos no puedan ser interceptados.
* __Acceso Remoto__: Permite a los usuarios acceder a recursos de red interna de forma segura desde ubicaciones remotas.
* __Redes Privadas Virtuales__: Establece conexiones seguras entre diferentes sitios, uniendo redes distribuidas en diferentes ubicaciones.
* __Firewall NAT__: Funciona a través de firewalls y NAT, permitiendo la conexión incluso en redes restringidas.
* __Cifrado Robusto__: Utiliza claves y certificados para asegurar que solo usuarios autorizados accedan a la red.

### Configuración

OpenVPN se configura utilizando archivos `.conf` en sistemas Linux o `.ovpn` en Windows. Estos archivos definen los parámetros necesarios para establecer la conexión VPN.

* __Windows__: `C:\Program Files\OpenVPN\config\client.ovpn`
* __Linux__: `/etc/openvpn/server.conf`

### Ejemplos

* __Configuración de Servidor__ `server.conf`:
   ```ini
   port 1194
   proto udp
   dev tun
   ca ca.crt
   cert server.crt
   key server.key
   dh dh2048.pem
   server 10.8.0.0 255.255.255.0
   ifconfig-pool-persist ipp.txt
   keepalive 10 120
   comp-lzo
   persist-key
   persist-tun
   status openvpn-status.log
   verb 3
   ```
* __Configuracion de cliente__ `/etc/openvpn/client.ovpn`:
   ```ini
   client
   dev tun
   proto udp
   remote my-server-1 1194
   resolv-retry infinite
   nobind
   persist-key
   persist-tun
   ca ca.crt
   cert client.crt
   key client.key
   remote-cert-tls server
   comp-lzo
   verb 3
   ```
* __Generacion de Certificados__
   ```ini
   ./easyrsa init-pki
   ./easyrsa build-ca
   ./easyrsa gen-req server nopass
   ./easyrsa sign-req server server
   ./easyrsa gen-dh
   ```

### Comandos
* __openvpn --config `server.conf`__: Inicia el servidor VPN con la configuración especificada
* __openvpn --genkey --secret `ta.key`__: Genera una clave TLS precompartida
* __openvpn --config `client.ovpn`__: Conéctate a una VPN usando el archivo de configuración del cliente
* __./easyrsa__: Herramienta para la gestión de claves y certificados