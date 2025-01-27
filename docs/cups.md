## Common Unix Printing System (CUPS)

Es un sistema de impresión que utiliza el __estándar IPP (Internet Printing Protocol)__ para gestionar _impresoras y trabajos de impresión_ en sistemas operativos basados en Unix. Permite a los _usuarios enviar trabajos_ de impresión a diversas impresoras de manera eficiente y ofrece una interfaz web para la __gestión de impresoras y trabajos__.

### Características Principales

* __Interfaz Web__: proporciona una interfaz accesible a través de un navegador para la administración de impresoras y trabajos.
* __Soporte para Múltiples Protocolos__: además de IPP, también soporta otros protocolos como LPD y SMB.
* __Manejo de Controladores__: puede utilizar drivers _PPD (PostScript Printer Description)_ para manejar diferentes tipos de impresoras.
* __Gestión de Trabajos__: Permite la creación, cancelación y monitoreo de trabajos de impresión.

### Instalacion del Servicio

* __Debian__
    ```bash
    sudo apt-get install cups # instalar el servicio
    sudo nano /etc/cups/cupsd.conf # archivo de configuracion
    sudo systemctl start cups # iniciar el servicio
    sudo systemctl enable cups # habilitar el servicio
    ```
* __CentOS__
    ```bash
    sudo yum install cups # instalar el servicio
    sudo nano /etc/cups/cupsd.conf # archivo de configuracion
    sudo systemctl start cups # iniciar el servicio
    sudo systemctl enable cups # habilitar el servicio
    ```
* __Configuracion Basica__
    ```xml
    Port 631
    WebInterface Yes
    <Location /printers>
        Order allow,deny
        Allow @LOCAL
    </Location>
    <Printer Office-Printer>
        Location Main Office
        DeviceURI ipp://192.168.0.100/ipp/print
        State Idle
        Accepting Yes
        JobSheets none none
        ErrorPolicy stop-printing
    </Printer>
    ```

* __lp `file.pdf`__: Envia un Trabajo de Impresión
* __lpstat -t__: Consulta el Estado de los Trabajos
* __cancel ID_del_trabajo__: Cancela un Trabajo Especifico

[volver](../readme.md)