## IP Tables

Es una interfaz de usuario para el __subsistema de filtrado de paquetes del kernel Linux__. Permite la administración de reglas de firewall y la _manipulación de paquetes de red_ según criterios definidos por el usuario. Utiliza varias tablas, cada una con diferentes cadenas que contienen reglas.

| Tabla | Funcion | 
|-|-|
| __filter__ | Filtrado de paquetes (predeterminada) |
| __nat__ | Traducción de direcciones de red |
| __mangle__ | Modificación de paquetes y sus propiedades |
| __raw__ | Procesamiento de paquetes antes de cualquier otro |

| Cadena | Paquetes | 
|-|-|
| __INPUT__ | Destinados al sistema local |
| __OUTPUT__ | Originados en el sistema local |
| __FORWARD__ | Aquellos redirigidos a través del sistema |
| __PREROUTING__ | Antes que se realice cualquier enrutamiento |
| __POSTROUTING__ | Después que se haya realizado el enrutamiento |

### Implementacion

* __Filtrado de Paquetes__: Controla qué paquetes pueden entrar o salir de un sistema basado en reglas.
* __NAT__: Modifica las IP de los paquetes para permitir la comunicación entre redes privadas y públicas.
* __Redirección de Puertos__: Util para acceder a servicios que están detrás de un firewall.
* __Registro de Paquetes__: información sobre el tráfico de red para auditoría o depuración de problemas.
* __Protección de Red__: Deniega paquetes que no cumplan con las reglas de seguridad establecidas.

### Comandos

iptables es una herramienta poderosa y flexible, pero puede ser compleja. Es importante tener cuidado al configurar las reglas para evitar bloquear el acceso legítimo a la red o al sistema.

| Parámetro| Descripción | Ejemplo |
|-|-|-|
| __-d__ | Especifica la dirección IP de destino | -d `192.168.0.1` |
| __-j__ | Especifica la acción a tomar (TARGET) | -j `ACCEPT` , -j `DROP` , -j `REJECT`|
| __-p__ | Especifica el protocolo | -p `tcp` , -p `udp`|
| __-s__ | Especifica la dirección IP de origen | -s `192.168.0.1`|
| __-t__ | Especifica la tabla a usar | -t `nat` |
| __-A__ | Agrega una regla a una cadena | -A `INPUT` -p `tcp` --dport `22` -j `ACCEPT` |
| __-D__ | Elimina una regla de una cadena | -D `INPUT` -p `tcp` --dport `22` -j `ACCEPT`|
| __-F__ | Elimina todas las reglas de una tabla | -F `INPUT`|
| __-I__ | Agrega una regla en una posición | -I `INPUT` `1` -p `tcp` --dport `22` -j `ACCEPT` |
| __-L__ | Lista las reglas actuales | -L `INPUT`|
| __-P__ | Establece la política predeterminada | -P `INPUT` `DROP`|
| __-R__ | Reemplaza alguna regla existente | -R `INPUT` `1` -p `tcp` --dport `22` -j `DROP`|
| __--dport__ | Especifica el puerto de destino | --dport `80` |
| __--sport__ | Especifica el puerto de origen | --sport `22`|

### Ejemplos

* [Capa de Enlace](./osi.md)
   * __iptables -A `INPUT` -i `enp0s3` -j `DROP`__: Permite el trafico en la interfaz
   * __iptables -A `INPUT` -i `lo` -j `ACCEPT`__: Permite el tráfico loopback
* [Capa de Red](./osi.md)
   * __iptables -A `INPUT` -s `8.8.8.8` -j `ACCEPT`__: Permite el trafico de la IP especificada
   * __iptables -A `INPUT` -s `10.0.0.0/24` -j `ACCEPT`__: Permite el tráfico de una subred específica
   * __iptables -A `INPUT` -p `icmp` -j DROP__: Bloquear todo el tráfico ICMP (Ping)
* [Capa de Transporte](./osi.md)
   * __iptables -A `INPUT` -p `tcp` --dport `443` -j `ACCEPT`__: Permite tráfico HTTPS
   * __iptables -A `INPUT` -p `udp` --dport `53` -j `ACCEPT`__: Permite el tráfico DNS
   * __iptables -A `INPUT` -p `tcp` --dport `22` -j `DROP`__: Bloquea el tráfico SSH
   * __iptables -t `nat` -A `PREROUTING` -p `tcp` --dport `80` -j `REDIRECT` --to-port `8080`__: Redirecciona el tráfico
* [Capa de Sesion](./osi.md)
   * __iptables -A `INPUT` -m `state` --state `ESTABLISHED`,`RELATED` -j `ACCEPT`__: Permite conexiones por su estado
   * __iptables -A `INPUT` -m `state` --state `INVALID` -j `DROP`__: Bloquea el tráfico inválido
* [Capa de Aplicación](./osi.md)
   * __iptables -A `OUTPUT` --dport `80` -m `string` --string `"www.google.com"` --algo `bm` -j `DROP`__: Bloquea el acceso a una URL
   * __iptables -A `OUTPUT` --dport `80` -m `string` --string `".exe"` --algo `bm` -j `DROP`__: Bloquea descargas de ejecutables
   * __service iptables `save`__: Guardar la configuración en distros Red Hat/CentOS
   * __iptables-save > `/etc/iptables/rules.v4`__: Guardar la configuración en distros Debian/Ubuntu

[volver](../readme.md)