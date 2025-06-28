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
    ```sh
    crypto isakmp policy 10
    authentication pre-share    # clave precompartida
    encryption aes              # cifrados: 3DES - AES - DES
    hash sha                    # algoritmo hash: SHA - MD5
    group 5                     # algoritmo Diffie-Hellman
    lifetime 86400              # duracion en segundos
    ```
* Router(config)# __(Configuración del Perfil IPsec)__
    ```sh
    crypto ipsec transform-set VPN-SET esp-aes esp-sha-hmac
    crypto isakmp key S3C/237 address 198.51.100.1
    ```
* Router(config)# __(Configuración del Túnel IPsec)__
    crypto map VPN-MAP 10 ipsec-isakmp asocia el mapa criptográfico con el protocolo IPsec e ISAKMP
    set peer 198.51.100.1 define la dirección IP del peer remoto
    set transform-set VPN-SET asocia el conjunto de transformación configurado
    match address 101 asocia la lista de acceso con el mapa criptográfico
* Router(config-if)#: __(Asignación del Túnel a la Interfaz)__
    interface gigabitEthernet 0/0 selecciona la interfaz de salida
    crypto map VPN-MAP aplica el mapa criptográfico a la interfaz seleccionada
* Router# __Verificación__
    * __show crypto isakmp `sa`__: muestra el estado de la fase 1 del ISAKMP
    * __show crypto ipsec `sa`__: muestra el estado de la fase 2 del IPsec
    * __show interfaces `tunnel`__: verifica el estado del túnel configurado

[volver](../readme.md)