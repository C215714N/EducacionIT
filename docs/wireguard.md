## Wireguard

Es una herramienta de VPN (Virtual Private Network) de alto rendimiento que está diseñada para ser simple y fácil de configurar.

### Instalacion y configuracion

* __Instalacion__: Dependiendo de la distribucion se pueden utilizar
    ```sh
    sudo apt install wireguard # Distros basadas en Debian/Ubuntu
    sudo yum install wireguard-tools # Distros basadas en RedHat/CentOS
    ```
* __Configurar Autenticacion__: Se deben generar las claves Publica y Privada para el cifrado  
   ```bash
   wg genkey | tee privatekey | wg pubkey > publickey # claves generada automaticamente
   ```
* __Servidor Conexion VPN__: En el directorio `/etc/wireguard/` debe crearse un archivo `wg0.conf`
   ```ini
   [Interface]
   PrivateKey = <clave_privada_del_servidor> # Clave para el servidor
   Address = 10.0.0.1/24 # Direccion IP LAN del servidor
   ListenPort = 51820 # Puerto de escucha
   SaveConfig = true # Guarda la configuracion

   [Peer]
   PublicKey = <clave_publica_del_cliente> # Clave para el cliente
   AllowedIPs = 10.0.0.2/32 # Trafico interesante
   ```
* __Cliente Conexion VPN__: Se debe configurar un archivo `wg0.conf` con una configuracion similar
   ```ini
   [Interface]
   PrivateKey = <clave_privada_del_cliente> # Clave para el Cliente
   Address = 10.0.0.2/24 # Direccion IP del Cliente

   [Peer]
   PublicKey = <clave_publica_del_servidor> # Clave para el Servidor
   Endpoint = <ip_o_dominio_del_servidor>:51820 # Direccion IP WAN del Sevidor
   AllowedIPs = 0.0.0.0/0 # Trafico procesado por la VPN
   PersistentKeepalive = 25 # tiempo en segundos
   ```

### Implementacion del Servicio

* __sudo wg-quick up `wg0`__: Inicializa la interfaz WireGuard
* __sudo wg__: Muestra el estado de las conexiones activas
* __sudo systemctl enable `wg-quick@wg0`__: Habilita el servicio

### Configuracion adicional

* __Reenvio de IP__: En caso de configurar un servidor con Wireguard se debe permitir el trafico adecuado.
   ```sh
   sudo ufw allow `51820`/`udp` # Distros basadas en Debian/Ubuntu 
   sudo firewall-cmd --add-port=51820/udp --permanent # Distros basadas en RedHat/CentOS
   sudo sysctl -w `net.ipv4.ip_forward=1` # Edita el archivo de configuracion "/etc/sysctl.conf"
   ```
* __Implementacion con NAT__: Si el servidor tiene acceso a internet, los cliente podrian navegar a traves de la VPN.
   ```sh
   sudo iptables -t `nat` -A POSTROUTING -o `enp0s3` -j MASQUERADE
   ```

[volver](../readme.md)