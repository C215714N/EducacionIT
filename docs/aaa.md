# AAA (Authentication, Authorization, Accounting)

AAA (Autenticación, Autorización y Contabilidad) es un framework de seguridad para controlar el acceso a los dispositivos de red y registrar la actividad de los usuarios. Se utiliza comúnmente con servidores externos como RADIUS o TACACS+ para una gestión centralizada.

1. switch(config)# __(Configuración Global de AAA)__
    * __aaa new-model__: Habilita el framework AAA.
    * __aaa authentication login `<list>` `<methods>`__: Crea una lista de métodos para la autenticación de inicio de sesión.
    * __aaa authorization exec `<list-name>` `<methods>`__: Crea una lista de métodos para la autorización de comandos de ejecución.
2. switch(config-sg-tacacs)# __(Configuración del Servidor)__
    * __`<protocol>` server `<name>`__ : Define un servidor RADIUS o TACACS+ segun el protocolo indicado.
    * __address ipv4 `<ip-address>`__: Especifica la dirección IP del servidor AAA.
    * __key `<shared-key>`__: Configura la clave secreta compartida con el servidor.
3. switch(config-line)# __(Aplicación en Líneas)__
    * __login authentication `<list-name>`__: Aplica una lista de autenticación a las líneas (vty, console).

## Implementacion

Para implementar AAA, primero se debe habilitar con `aaa new-model`. Luego, se definen los servidores externos (ej. TACACS+). Se crean listas de métodos que especifican cómo se realizarán la autenticación y la autorización (por ejemplo, primero intentar con el servidor TACACS+ y, si falla, usar la base de datos local). Finalmente, estas listas se aplican a las líneas de acceso (como las VTY para SSH/Telnet).

```sh
aaa new-model
!
tacacs server AAA_SERVER
address ipv4 192.168.1.100
key t4c4cs+S3cr3tKey
!
aaa authentication login VTY_LOGIN group tacacs+ local
!
line vty 0 15
login authentication VTY_LOGIN
transport input ssh
```

[volver](../readme.md)