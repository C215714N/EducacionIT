## Virtual Private Network Site-to-Site

Una VPN site-to-site conecta dos redes distintas a través de internet, permitiendo que los dispositivos en ambas redes se comuniquen entre sí de manera segura como si estuvieran en la misma red local. Se utiliza principalmente para conectar oficinas remotas o sucursales a una red central, garantizando la confidencialidad e integridad de los datos transmitidos.

### Características:

* __Conectividad Segura__: Utiliza túneles cifrados para proteger los datos mientras viajan a través de internet.
* __Transparencia__: Los dispositivos se comunican como si estuvieran en la misma red local, sin necesidad de configuración adicional.
* __Escalabilidad__: Permite la conexión de múltiples sitios remotos a una red central.
* __Ahorro de Costos__: Utiliza la infraestructura de internet existente, eliminando la necesidad de líneas privadas.
* __Fiabilidad__: Asegura la continuidad del negocio mediante la conexión permanente entre sitios.

### Implementación:

* __Conexión de Sucursales a la Oficina Central__: Se configuran túneles VPN entre las sucursales y la oficina central, permitiendo el acceso seguro a los recursos compartidos.
* __Interconexión de Redes en Diferentes Ubicaciones Geográficas__: Facilita la integración de diferentes redes en una única red empresarial, mejorando la colaboración y acceso a recursos.
* __Conexión Segura de Data Centers__: Se puede utilizar una VPN site-to-site para conectar de manera segura centros de datos en diferentes ubicaciones.

* Router(config)# __(Configuración del Túnel VPN)__
    * __crypto isakmp policy `10`__: define la política de ISAKMP con prioridad 10
    * __authentication `pre-share`__: selecciona la autenticación pre-compartida
    * __encryption `aes`__: define el tipo de cifrado (AES en este caso)
    * __hash `sha256`__: selecciona el algoritmo de hash (SHA-256 en este caso)
    * __group `14`__: define el grupo de Diffie-Hellman (grupo 14)
    * __lifetime `86400`__: establece el tiempo de vida en segundos para la política
* Router(config)# __(Configuración del Perfil IPsec)__
    * __crypto ipsec transform-set `VPN-SET`__: crea y nombra un conjunto de transformación
    * __esp-aes `256` esp-sha-hmac__: define los algoritmos de cifrado y autenticación para el IPsec
* Router(config)# __(Configuración del Túnel IPsec)__
    * __crypto map `VPN-MAP` 10 ipsec-isakmp__: asocia el mapa criptográfico con el protocolo IPsec e ISAKMP
    * __set peer `198.51.100.1`__: define la dirección IP del peer remoto
    * __set transform-set `VPN-SET`__: asocia el conjunto de transformación configurado
    * __match address `101`__: asocia la lista de acceso con el mapa criptográfico
* Router(config-if)#: __(Asignación del Túnel a la Interfaz)__
    * __interface `gigabitEthernet 0/0`__: selecciona la interfaz de salida
    * __crypto map `VPN-MAP`__: aplica el mapa criptográfico a la interfaz seleccionada
* Router# __Verificación__:
    * __show crypto isakmp `sa`__: muestra el estado de la fase 1 del ISAKMP
    * __show crypto ipsec `sa`__: muestra el estado de la fase 2 del IPsec
    * __show interfaces `tunnel`__: verifica el estado del túnel configurado