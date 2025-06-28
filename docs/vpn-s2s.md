# Virtual Private Network Site-to-Site

Una VPN site-to-site conecta dos redes distintas a través de internet, permitiendo que los dispositivos en ambas redes se comuniquen entre sí de manera segura como si estuvieran en la misma red local. Se utiliza principalmente para conectar oficinas remotas o sucursales a una red central, garantizando la confidencialidad e integridad de los datos transmitidos.

| Caracteristica | Descripcion |
|--|--|
| __Seguridad__ | Utiliza túneles cifrados para proteger los datos mientras viajan a través de internet |
| __Transparencia__ | Los dispositivos se comunican como si estuvieran en la misma red local, sin necesidad de configuración adicional |
| __Escalabilidad__ | Permite la conexión de múltiples sitios remotos a una red central |
| __Economizacion__ | Utiliza la infraestructura de internet existente, eliminando la necesidad de líneas privadas |
| __Fiabilidad__ | Asegura la continuidad del negocio mediante la conexión permanente entre sitios |

## Implementación:

* __Conexión de Sucursales a la Oficina Central__: Se configuran túneles VPN entre las sucursales y la oficina central, permitiendo el acceso seguro a los recursos compartidos.
* __Interconexión de Redes en Diferentes Ubicaciones Geográficas__: Facilita la integración de diferentes redes en una única red empresarial, mejorando la colaboración y acceso a recursos.
* __Conexión Segura de Data Centers__: Se puede utilizar una VPN site-to-site para conectar de manera segura centros de datos en diferentes ubicaciones.

## Configuracion

Cuando se configura una VPN site-to-site, debemos crear una __ACL (Access Control List)__ que incluya las redes privadas de origen y destino, para que se implemente dicha configuracion. En caso de utilizar __NAT (Network Address Translation)__, sera necesario agregar, a la Lista de control de acceso las exclusiones al principio, para que no se utilice dicha configuracion.

* __Configuración de Directivas ISAKMP__
    ```sh
    crypto isakmp policy 10
    authentication pre-share    # clave precompartida
    encryption aes              # cifrados: 3DES - AES - DES
    hash sha                    # algoritmo hash: SHA - MD5
    group 5                     # algoritmo Diffie-Hellman
    lifetime 86400              # duracion en segundos
    ```
* __Definicion del Conjunto de Transformacion__
    ```sh
    crypto ipsec transform-set VPN-SET esp-aes esp-sha-hmac # secuencia de autenticacion y cifrado
    crypto isakmp key S3C/237 address 198.51.100.1          # clave precompartida y host remoto
    ```
* __Configuración del Mapa Criptografico__
    ```sh
    crypto map VPN-MAP 10 ipsec-isakmp  # asociacion del mapa criptográfico 
    set peer 198.51.100.1               # dirección IP del peer remoto
    set transform-set VPN-SET           # asociacion del conjunto de transformación
    match address VPN-ACL               # asociacion la lista de acceso
    ```
* __Asignación del Túnel a la Interfaz__
    ```sh
    interface gigabitEthernet 0/0 # interfaz de salida
    crypto map VPN-MAP            # aplica el mapa criptográfico
    ```
## Verificacion

Para corroborar si la configuracion del tunel VPN se implemento correctamente o saber cuando se envian mensajes a traves de las interfaces que forman el mismo, podemos utilizar alguno de los siguientes comandos.

* __Router#__ (Comandos de Verificación):
    * __show crypto isakmp `sa`__: muestra el estado de la fase 1 del ISAKMP
    * __show crypto ipsec `sa`__: muestra el estado de la fase 2 del IPsec
    * __show interfaces `tunnel`__: verifica el estado del túnel configurado

[volver](../readme.md)