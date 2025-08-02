# Configuracion Inicial

Cuando configuramos un dispositivo de internetworks por primera vez, debemos hacerlo utilizando el *cable de consola (RS-232)* ya que se se encuentra por fuera de la banda de red y solamente podemos acceder a su configuracion utilizando este elemento.

1. switch> __(modo estandar)__
    * __enable__: habilita el modo privilegiado
2. switch# __(modo privilegiado)__
    * __configure terminal__: accede al modo de configuracion global
3. switch(config)# __(modo configuracion global)__
    * __hostname `<name>`__: define el nombre del dispositivo
    * __ip domain name `<domain>`__: define el nombre de dominio al que pertenece el dispositivo.
    * __banner motd `#message#`__: establece el mensaje de acceso necesario para cuestiones legales

## Implementacion

La configuracion general para un __switch o router administrable__ es similar, ya que debemos acceder a traves de un emulador de terminal y colocar todo parametro correspondiente a un _valor personalizado en mayusculas_, como el nombre del dispositivo, para identificarlo mas facilmente.

```sh
enable
configure terminal
!
hostname R-CORE-01
ip domain name ENTERPRISE.NET
banner motd "ACCESO RESTRINGIDO. SOLO PERSONAL AUTORIZADO"
```

[volver](../readme.md)